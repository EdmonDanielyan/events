import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/screens/messages/chat/entities/form_entities.dart';

class ChatFunctions {
  final ChatDatabaseCubit chatDatabaseCubit;

  const ChatFunctions(this.chatDatabaseCubit);

  void deleteMessages(List<MessageTable> messages) {
    if (messages.isNotEmpty) {
      for (final message in messages) {
        chatDatabaseCubit.db.deleteMessage(message);
      }
    }
  }

  void deleteAllChatMessages(int chatId) {
    chatDatabaseCubit.db.deleteMessagesByChatId(chatId);
  }

  void deleteChat(int chatId) {
    chatDatabaseCubit.db.deleteChatById(chatId);
  }

  void sendTextMessage(ChatTable chat, ChatEntities chatEntities) {
    chatDatabaseCubit.db.insertMessage(
      MessageTable(
        chatId: chat.id!,
        message: chatEntities.text,
        userId: JwtPayload.myId,
        read: false,
        status: MessageStatus.SENDING,
        created: new DateTime.now(),
      ),
    );

    chatDatabaseCubit.db.insertMessage(
      MessageTable(
        chatId: chat.id!,
        message: "Ты написал: ${chatEntities.text}",
        userId: 10,
        read: false,
        status: MessageStatus.SENDING,
        created: new DateTime.now(),
      ),
    );

    _setChatToFirst(chat);
  }

  void updateChat(ChatTable chat) {
    chatDatabaseCubit.setSelectedChat(chat);
    chatDatabaseCubit.db.updateChat(chat);
  }

  void _setChatToFirst(ChatTable chat) {
    chatDatabaseCubit.db
        .updateChatById(chat.id!, chat.copyWith(updatedAt: new DateTime.now()));
  }
}
