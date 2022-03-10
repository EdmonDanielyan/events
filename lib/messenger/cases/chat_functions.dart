import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/database/schema/db_enum.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/models/jwt_payload.dart';

@injectable
class ChatFunctions {
  final ChatDatabaseCubit chatDatabaseCubit;
  final Messenger messenger;

  const ChatFunctions(this.chatDatabaseCubit, this.messenger);

  Future<void> setChatToFirst(ChatTable chat, {DateTime? updatedAt}) async {
    DateTime update = updatedAt ?? DateTime.now();

    if (chat.updatedAt.isAfter(update)) {
      return;
    }

    await chatDatabaseCubit.db.updateChat(
      chat.copyWith(updatedAt: update),
    );
  }

  Future<void> editMessages(List<MessageTable> messages) async {
    for (final message in messages) {
      chatDatabaseCubit.db.updateMessageById(message.id, message);
    }
  }

  Future<void> setPreviousMsgToFirst(String chatId) async {
    final messages = await chatDatabaseCubit.db.getLastMessages(chatId, 1);
    var chat = await chatDatabaseCubit.db.selectChatById(chatId);

    if (chat != null &&
        messages != null &&
        messages.isNotEmpty &&
        messages.first.timestamp != null) {
      await chatDatabaseCubit.db.updateChat(chat.copyWith(updatedAt: messages.first.timestamp!));
    }
  }

  Future<void> deleteMessages(List<MessageTable> messages,
      {bool setPrevious = false}) async {
    if (messages.isNotEmpty) {
      for (final message in messages) {
        if (await chatDatabaseCubit.db.selectMessageById(message.id) != null) {
          await chatDatabaseCubit.db.deleteMessageById(message.id);

          if (setPrevious) {
            setPreviousMsgToFirst(message.chatId);
          }
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

  void updateChat(ChatTable chat, {bool setSelectedChat = false}) {
    if (setSelectedChat) {
      chatDatabaseCubit.setSelectedChat(chat);
    }
    chatDatabaseCubit.db.updateChat(chat);
    var topic = chat.channel;
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
      {required bool onlyIfMyMessages, bool readStatus = true}) async {
    bool setRead = true;
    if (onlyIfMyMessages && message.userId != JwtPayload.myId) {
      setRead = false;
    }

    if (setRead) {
      await chatDatabaseCubit.db.updateMessagesReadStatus(
          message, onlyIfMyMessages ? 0 : JwtPayload.myId, readStatus);
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
      updateChat(
        chat.copyWith(
          updatedAt: lastMessageSeq.timestamp,
          lastMessageSeq: lastMessageSeq.sequence,
          notificationsOn: true,
        ),
      );
    }
    deleteAllChatMessages(chat.id);
    await messenger.chatSaver.saveChats(newChat: null);
  }

  Future<void> clearGroup(ChatTable chat) async {
    deleteAllChatMessages(chat.id);
    updateChat(chat.copyWith(updatedAt: DateTime.now()));
  }
}
