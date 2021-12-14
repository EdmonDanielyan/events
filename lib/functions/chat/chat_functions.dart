import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:ink_mobile/providers/message_provider.dart';

@injectable
class ChatFunctions {
  final ChatDatabaseCubit chatDatabaseCubit;
  final Messenger messenger;

  const ChatFunctions(this.chatDatabaseCubit, this.messenger);

  void setChatToFirst(ChatTable chat) {
    chatDatabaseCubit.db.updateChatById(
      chat.id,
      chat.copyWith(
        updatedAt: new DateTime.now(),
        millisecondsSinceEpoch:
            new DateTime.now().millisecondsSinceEpoch.toString(),
      ),
    );
  }

  Future<void> editMessages(List<MessageTable> messages) async {
    for (final message in messages) {
      chatDatabaseCubit.db.updateMessageById(message.id, message);
    }
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

  Future<void> messagesToRead(
      List<MessageTable> messages) async {
    for (final message in messages) {
      await updateMessageStatus(message, MessageStatus.READ);
    }
  }


}
