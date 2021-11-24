import 'package:flutter/material.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/chat_list_view.dart';
import 'package:ink_mobile/models/chat/chat_user.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/screens/messages/chat/chat_screen.dart';

class ChatAppBarTitle extends StatelessWidget {
  final ChatTable chat;
  final ChatDatabaseCubit chatDatabaseCubit;
  const ChatAppBarTitle(
      {Key? key, required this.chat, required this.chatDatabaseCubit})
      : super(key: key);

  bool get isGroup => ChatListView.isGroup(chat);

  int? get oppositeUserId => ChatUserViewModel.getOppositeUserIdFromChat(chat);

  @override
  Widget build(BuildContext context) {
    final _chatScrenParams = ChatScreen.of(context).chatScreenParams;

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed("/chat_info"),
      child: Column(
        children: [
          StreamBuilder<ChatTable>(
            stream: chatDatabaseCubit.db.watchChatById(chat.id),
            builder: (context, state) {
              var newChat = chat;
              if (state.hasData && state.data != null) {
                newChat = state.data!;
              }

              return Text(
                _chatScrenParams.appBarText ?? (newChat.name),
                style: TextStyle(fontSize: 17.0),
                textAlign: TextAlign.center,
              );
            },
          ),
          _onlineWidget(),
        ],
      ),
    );
  }

  Widget _onlineWidget() {
    final strings = localizationInstance;
    if (!isGroup) {
      return StreamBuilder(
        stream: chatDatabaseCubit.db.watchUser(oppositeUserId!),
        builder: (context, AsyncSnapshot<UserTable> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            UserTable user = snapshot.data!;
            return Text(
              user.online ? strings.online : strings.offline,
              style: TextStyle(fontSize: 13.0, color: Colors.blueGrey[300]),
              textAlign: TextAlign.center,
            );
          }
          return SizedBox();
        },
      );
    }
    return SizedBox();
  }
}
