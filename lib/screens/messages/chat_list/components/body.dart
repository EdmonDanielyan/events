import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/loader/error_loading_widget.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_state.dart';
import 'package:ink_mobile/cubit/chat_list/chat_list_cubit.dart';
import 'package:ink_mobile/cubit/chat_list/chat_list_state.dart';
import 'package:ink_mobile/functions/chat/open_chat.dart';
import 'package:ink_mobile/functions/textfield_utils.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/screens/messages/chat_list/chat_list_screen.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/search_bar.dart';

import 'chat.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _contentPadding = EdgeInsets.symmetric(horizontal: 10);
  late ChatDatabaseCubit _chatDatabaseCubit;
  late ChatListCubit _chatListCubit;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _chatDatabaseCubit = ChatListScreen.of(context).chatDatabaseCubit;
    _chatListCubit = ChatListScreen.of(context).chatListCubit;

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 12.0),
          BlocBuilder<ChatDatabaseCubit, ChatDatabaseCubitState>(
            bloc: _chatDatabaseCubit,
            builder: (_context, state) {
              return StreamBuilder(
                stream: state.db.watchAllChats(),
                builder: (context, AsyncSnapshot<List<ChatTable>> snapshot) {
                  if (snapshot.hasData) {
                    final items = snapshot.data ?? [];
                    if (items.isNotEmpty) {
                      _chatListCubit.emitChats(items);
                      return _buildItems();
                    } else {
                      return _noMessages();
                    }
                  }

                  return SizedBox();
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildItems() {
    return Column(
      children: [
        SearchBar(
          controller: _searchController,
          contentPadding: _contentPadding,
          onChanged: (val) => _chatListCubit.setSearchValue(val),
        ),
        BlocBuilder<ChatListCubit, ChatListState>(
            bloc: _chatListCubit,
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
                  stream:
                      _chatDatabaseCubit.db.watchChatMessages(chats[index].id),
                  builder: (context,
                      AsyncSnapshot<List<MessageWithUser>?> snapshot) {
                    if (snapshot.hasData) {
                      List<MessageWithUser> messagesWithUser =
                          snapshot.data ?? [];

                      return ChatListTile(
                        onTap: () {
                          OpenChat(_chatDatabaseCubit, chats[index])
                              .call(context);
                          _chatListCubit.setSearchValue("");
                          _searchController.text = "";
                          TextFieldUtils.loseTextFieldFocus();
                        },
                        highlightValue: state.searchValue,
                        index: index,
                        chat: chats[index],
                        contentPadding: _contentPadding,
                        chatDatabaseCubit: _chatDatabaseCubit,
                        messagesWithUser: messagesWithUser,
                      );
                    }
                    return SizedBox();
                  },
                ),
              );
            }),
      ],
    );
  }

  Widget _noMessages() {
    return Center(
      child: ErrorLoadingWidget(errorMsg: localizationInstance.noMessages),
    );
  }
}
