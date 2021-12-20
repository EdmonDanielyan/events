import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/providers/notifications.dart';

class PushChatNotification {
  final ChatDatabaseCubit chatDatabaseCubit;
  final String chatId;
  final UserTable user;
  final ChatTable? myChat;
  final MessageTable message;

  const PushChatNotification(
      {required this.chatDatabaseCubit,
      required this.chatId,
      required this.user,
      required this.myChat,
      required this.message});

  Future<void> call({bool checkTime = true}) async {
    bool showNotification = true;

    final selectedChat = chatDatabaseCubit.selectedChat;

    if (myChat != null && !myChat!.notificationsOn!) {
      showNotification = false;
    }

    if (selectedChat != null && selectedChat.id == chatId) {
      showNotification = false;
    }

    final newMessageDate = message.created!.add(Duration(seconds: 30));

    if (checkTime &&
        newMessageDate.toUtc().isBefore(new DateTime.now().toUtc())) {
      showNotification = false;
    }

    if (showNotification) {
      NotificationsProvider.showNotification(
        user.name,
        message.message,
        id: user.id,
      );
    }
  }
}
