import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';

class ChatFunctions {
  final ChatDatabaseCubit chatDatabaseCubit;

  const ChatFunctions(this.chatDatabaseCubit);

  void setChatToFirst(ChatTable chat) {
    chatDatabaseCubit.db
        .updateChatById(chat.id, chat.copyWith(updatedAt: new DateTime.now()));
  }

  void deleteMessages(List<MessageTable> messages) {
    if (messages.isNotEmpty) {
      for (final message in messages) {
        chatDatabaseCubit.db.deleteMessageById(message.id);
      }
    }
  }

  void deleteAllChatMessages(String chatId) {
    chatDatabaseCubit.db.deleteMessagesByChatId(chatId);
  }

  void deleteChat(String chatId) {
    chatDatabaseCubit.db.deleteChatById(chatId);
  }

  void updateChat(ChatTable chat) {
    chatDatabaseCubit.setSelectedChat(chat);
    chatDatabaseCubit.db.updateChatById(chat.id, chat);
  }

  Future<void> updateMessageStatus(
      MessageTable message, MessageStatus messageStatus) async {
    message = message.copyWith(status: messageStatus);
    chatDatabaseCubit.db.updateMessageById(message.id, message);
  }
}
