import 'package:flutter/material.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/chat_list_view.dart';
import 'package:ink_mobile/models/chat/chat_user.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/screens/messages/chat/entities/chat_screen_params.dart';

class ChatAppBarTitle extends StatelessWidget {
  final ChatTable chat;
  final ChatDatabaseCubit chatDatabaseCubit;

  final ChatScreenParams chatScreenParams;
  const ChatAppBarTitle(
      {Key? key,
        required this.chat,
        required this.chatScreenParams,
        required this.chatDatabaseCubit})
      : super(key: key);

  bool get isGroup => ChatListView.isGroup(chat);

  int? get oppositeUserId => ChatUserViewModel.getOppositeUserIdFromChat(chat);

  @override
  Widget build(BuildContext context) {

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
                chatScreenParams.appBarText ?? (newChat.name),
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
    if (!isGroup) {
      final Map<bool, Widget> cacheUserStatusWidgetOfSingleChat = {};

      return StreamBuilder(
        stream: chatDatabaseCubit.db.watchUser(oppositeUserId!),
        builder: (context, AsyncSnapshot<UserTable?> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            UserTable user = snapshot.data!;
            return cacheUserStatusWidgetOfSingleChat.putIfAbsent(user.online, () =>
                Text(
                  user.online ? localizationInstance.online : localizationInstance.offline,
                  style: TextStyle(fontSize: 13.0, color: Colors.blueGrey[300]),
                  textAlign: TextAlign.center,
                ));
          }
          return const SizedBox();
        },
      );
    }
    return const SizedBox();
  }
}
