import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/open_chat.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/providers/notifications.dart';

import '../../app.dart';

class ChatNotification {
  final ChatDatabaseCubit chatDatabaseCubit;
  final ChatTable chat;
  final UserTable user;
  final ChatTable? myChat;
  final MessageTable message;

  const ChatNotification(
      {required this.chatDatabaseCubit,
      required this.chat,
      required this.user,
      required this.myChat,
      required this.message});

  Future<void> call({bool checkTime = true}) async {
    bool showNotification = true;

    final selectedChat = chatDatabaseCubit.selectedChat;

    if (myChat != null && !myChat!.notificationsOn!) {
      showNotification = false;
    }

    if (selectedChat != null && selectedChat.id == chat.id) {
      showNotification = false;
    }

    final newMessageDate = message.created!.add(Duration(seconds: 30));

    if (checkTime &&
        newMessageDate.toUtc().isBefore(new DateTime.now().toUtc())) {
      showNotification = false;
    }

    if (showNotification && !chatDatabaseCubit.state.loadingChats) {
      NotificationsProvider.showNotification(user.name, message.message,
          id: user.id, payload: chat.id, onSelect: () {
        if (App.getContext != null) {
          OpenChat(chatDatabaseCubit, chat)(App.getContext!);
        }
      });
    }
  }
}
