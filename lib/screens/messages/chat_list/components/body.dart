import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/loader/error_loading_widget.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_state.dart';
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

  @override
  Widget build(BuildContext context) {
    _chatDatabaseCubit = ChatListScreen.of(context).chatDatabaseCubit;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 2.0),
          SizedBox(height: 10.0),
          BlocBuilder<ChatDatabaseCubit, ChatDatabaseCubitState>(
            bloc: _chatDatabaseCubit,
            builder: (_context, state) {
              return StreamBuilder(
                stream: state.searchValue.isNotEmpty
                    ? state.db.searchChats(state.searchValue)
                    : state.db.watchAllChats(),
                builder: (context, AsyncSnapshot<List<ChatTable>> snapshot) {
                  if (snapshot.hasData) {
                    final items = snapshot.data ?? [];
                    if (items.isNotEmpty || state.searchValue.isNotEmpty) {
                      return _buildItems(items);
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

  Widget _buildItems(List<ChatTable> items) {
    return Column(
      children: [
        SearchBar(
          contentPadding: _contentPadding,
          onChanged: (val) => _chatDatabaseCubit.updateSearch(val),
        ),
        ListView.builder(
          itemCount: items.length,
          shrinkWrap: true,
          controller: ScrollController(keepScrollOffset: false),
          itemBuilder: (_, index) => StreamBuilder(
            stream: _chatDatabaseCubit.db.watchChatMessages(items[index].id),
            builder: (context, AsyncSnapshot<List<MessageWithUser>?> snapshot) {
              if (snapshot.hasData) {
                List<MessageWithUser> messagesWithUser = snapshot.data ?? [];
                return ChatListTile(
                  highlightValue: _chatDatabaseCubit.searchVal,
                  index: index,
                  chat: items[index],
                  contentPadding: _contentPadding,
                  chatDatabaseCubit: _chatDatabaseCubit,
                  messagesWithUser: messagesWithUser,
                );
              }
              return SizedBox();
            },
          ),
        ),
      ],
    );
  }

  Widget _noMessages() {
    return Center(
      child: ErrorLoadingWidget(errorMsg: localizationInstance.noMessages),
    );
  }
}
