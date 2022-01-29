import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/database/tables/db_enum.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/messenger.dart';

@injectable
class ChatFunctions {
  final ChatDatabaseCubit chatDatabaseCubit;
  final Messenger messenger;

  const ChatFunctions(this.chatDatabaseCubit, this.messenger);

  void setChatToFirst(ChatTable chat) {
    chatDatabaseCubit.db.updateChatById(
      chat.id,
      chat.copyWith(
        updatedAt: DateTime.now(),
      ),
    );
  }

  Future<void> editMessages(List<MessageTable> messages) async {
    for (final message in messages) {
      chatDatabaseCubit.db.updateMessageById(message.id, message);
    }
  }

  Future<void> deleteMessages(List<MessageTable> messages) async {
    if (messages.isNotEmpty) {
      for (final message in messages) {
        if (await chatDatabaseCubit.db.selectMessageById(message.id) != null) {
          chatDatabaseCubit.db.deleteMessageById(message.id);
        }
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
    var topic = messenger.natsProvider.getChatChannelById(chat.id);
    if (chat.notificationsOn ?? true) {
      messenger.pushNotificationManager.subscribeToTopic(topic);
    } else {
      messenger.pushNotificationManager.unsubscribeFromTopic(topic);
    }
  }

  Future<void> updateMessageStatus(
      MessageTable message, MessageSentStatus messageStatus) async {
    message = message.copyWith(sentStatus: messageStatus);
    chatDatabaseCubit.db.updateMessageById(message.id, message);
  }

  Future<void> messagesToRead(MessageTable message,
      {required bool onlyIfMyMessages,
      bool readStatus = true}) async {
    bool setRead = true;
    if (onlyIfMyMessages && message.userId != JwtPayload.myId) {
      setRead = false;
    }

    if (setRead) {
      await chatDatabaseCubit.db.updateMessagesReadStatus(message,
          onlyIfMyMessages ? 0 : JwtPayload.myId,
          readStatus);
    }
  }

  Future<List<MessageTable>> getMyMessagesByType(
      String chatId, StoredMessageType type,
      {required int userId}) async {
    var myMessages = await chatDatabaseCubit.db
        .selectMessagesByUserAndChatId(chatId, userId);
    if (myMessages.isNotEmpty) {
      myMessages.removeWhere((element) => element.type != type);
    }

    return myMessages;
  }

  Future<void> clearSingleChat(ChatTable chat) async {
    final lastMessageSeq =
        await chatDatabaseCubit.db.selectMessageByChatIdInSeqOrder(chat.id);

    if (lastMessageSeq != null) {
      updateChat(chat.copyWith(
          updatedAt: DateTime.now(), lastMessageSeq: lastMessageSeq.sequence));
    }
    deleteAllChatMessages(chat.id);
    await messenger.chatSaver.saveChats(newChat: null);
  }

  Future<void> clearGroup(ChatTable chat) async {
    deleteAllChatMessages(chat.id);
    updateChat(chat.copyWith(updatedAt: DateTime.now()));
  }
}
