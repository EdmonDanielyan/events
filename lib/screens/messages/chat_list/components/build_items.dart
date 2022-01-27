import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/cubit/chat_list/search_chat_cubit.dart';
import 'package:ink_mobile/cubit/chat_list/search_chat_state.dart';
import 'package:ink_mobile/extensions/chat_table.dart';
import 'package:ink_mobile/functions/chat/open_chat.dart';
import 'package:ink_mobile/functions/textfield_utils.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/database/model/message_with_user.dart';
import 'package:moor/moor.dart';

import 'chat.dart';

class BuildChatItems extends StatelessWidget {
  final ChatDatabaseCubit chatDatabaseCubit;
  final SearchChatCubit searchChatCubit;
  final EdgeInsetsGeometry? contentPadding;
  final Function(ChatTable, BuildContext) deleteChat;
  final TextEditingController searchController;
  const BuildChatItems({
    Key? key,
    required this.searchChatCubit,
    required this.chatDatabaseCubit,
    required this.contentPadding,
    required this.deleteChat,
    required this.searchController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchChatCubit, SearchChatState>(
      bloc: searchChatCubit,
      builder: (context, state) {
        List<ChatTable> chats = state.searchChats;
        chats.sort((a, b) {
          if (a.millisecondsSinceEpoch != null &&
              b.millisecondsSinceEpoch != null) {
            return b.millisecondsSinceEpoch!
                .compareTo(a.millisecondsSinceEpoch!);
          }

          return b.updatedAt.compareTo(a.updatedAt);
        });

        return ListView.builder(
          itemCount: chats.length,
          shrinkWrap: true,
          controller: ScrollController(keepScrollOffset: false),
          itemBuilder: (_, index) => StreamBuilder(
            stream: chatDatabaseCubit.db.watchChatMessages(chats[index].id,
                orderMode: OrderingMode.asc),
            builder: (context, AsyncSnapshot<List<MessageWithUser>?> snapshot) {
              if (snapshot.hasData) {
                List<MessageWithUser> messagesWithUser = snapshot.data ?? [];

                //HIDING EMPTY SINGLE CHATS
                if (messagesWithUser.isEmpty && !chats[index].isGroup()) {
                  return const SizedBox();
                }

                return ChatListTile(
                  onTap: () {
                    OpenChat(chatDatabaseCubit, chats[index]).call();
                    searchChatCubit.setSearchValue("");
                    searchController.text = "";
                    TextFieldUtils.loseTextFieldFocus();
                  },
                  onDismissed: (dismissed) => deleteChat(chats[index], context),
                  highlightValue: state.searchValue,
                  index: index,
                  chat: chats[index],
                  contentPadding: contentPadding,
                  searchMessage: searchChatCubit.searchMessage != null &&
                          searchChatCubit.searchMessage!.chatId ==
                              chats[index].id
                      ? searchChatCubit.searchMessage
                      : null,
                  chatDatabaseCubit: chatDatabaseCubit,
                  messagesWithUser: messagesWithUser,
                );
              }
              return SizedBox();
            },
          ),
        );
      },
    );
  }
}
