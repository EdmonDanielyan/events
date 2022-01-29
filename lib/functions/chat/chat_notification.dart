import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';

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

    final newMessageDate = (message.timestamp ?? DateTime.now()).add(Duration(seconds: 30));

    if (checkTime &&
        newMessageDate.isBefore(DateTime.now().toUtc())) {
      showNotification = false;
    }

    if (showNotification && !chatDatabaseCubit.state.loadingChats) {
      // sl<LocalNotificationsProvider>().showNotification(
      //     user.name, message.message, id: message.hashCode, payload: chat.id,
      //     onSelect: (payload) {
      //   if (App.getContext != null) {
      //     OpenChat(chatDatabaseCubit, chat)();
      //   }
      // });
    }
  }
}
