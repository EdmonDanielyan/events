import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/functions/textfield_utils.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/blocs/chat_list/search_chat_cubit.dart';
import 'package:ink_mobile/messenger/blocs/chat_list/search_chat_state.dart';
import 'package:ink_mobile/messenger/cases/open_chat.dart';
import 'package:ink_mobile/messenger/extensions/chat_table.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/database/model/message_with_user.dart';
import 'package:moor/moor.dart';

import '../../../../components/alert/alert_cancel.dart';
import 'chat.dart';

class BuildChatItems extends StatefulWidget {
  final ChatDatabaseCubit chatDatabaseCubit;
  final SearchChatCubit searchChatCubit;
  final EdgeInsetsGeometry? contentPadding;
  final Future<bool> Function(ChatTable, BuildContext) deleteChat;
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
  State<BuildChatItems> createState() => _BuildChatItemsState();
}

class _BuildChatItemsState extends State<BuildChatItems> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchChatCubit, SearchChatState>(
      bloc: widget.searchChatCubit,
      builder: (context, state) {
        List<ChatTable> chats = state.searchChats;

        return ListView.builder(
          itemCount: chats.length,
          shrinkWrap: true,
          controller: ScrollController(keepScrollOffset: false),
          itemBuilder: (_, index) => StreamBuilder(
            stream: widget.chatDatabaseCubit.db.watchChatMessages(
                chats[index].id,
                orderMode: OrderingMode.asc),
            builder: (context, AsyncSnapshot<List<MessageWithUser>?> snapshot) {
              if (snapshot.hasData) {
                List<MessageWithUser> messagesWithUser = snapshot.data ?? [];

                //HIDING EMPTY SINGLE CHATS
                if (messagesWithUser.isEmpty && !chats[index].isGroup()) {
                  return const SizedBox();
                }

                MessageWithUser? searchMessage;

                if (widget.searchChatCubit.searchMessage != null) {
                  widget.searchChatCubit.searchMessage!.forEach((element) {
                    if (element.message?.chatId == chats[index].id) {
                      searchMessage = element;
                    }
                  });
                }

                return ChatListTile(
                  onTap: () {
                    OpenChat(widget.chatDatabaseCubit, chats[index]).call();
                    widget.searchChatCubit.setSearchValue("");
                    widget.searchController.text = "";
                    TextFieldUtils.loseTextFieldFocus();
                  },
                  //onDismissed: (dismissed) => deleteChat(chats[index], context),
                  confirmDismiss: (direction) async {
                    CustomAlertCancel(
                      context,
                      title: localizationInstance.delete,
                      body: localizationInstance.deleteChatHint,
                      onSubmit: () async {
                        final deleted =
                            await widget.deleteChat(chats[index], context);
                        if (deleted) {
                          Navigator.of(context).pop();
                        }
                      },
                    ).call();

                    return false;
                  },
                  highlightValue: state.searchValue,
                  index: index,
                  chat: chats[index],
                  contentPadding: widget.contentPadding,
                  searchMessage: searchMessage,
                  chatDatabaseCubit: widget.chatDatabaseCubit,
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
