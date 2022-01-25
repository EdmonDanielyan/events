import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
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
    var topic = messenger.natsProvider.getGroupTextChannelById(chat.id);
    if (chat.notificationsOn ?? true) {
      messenger.pushNotificationManager.subscribeToTopic(topic);
    } else {
      messenger.pushNotificationManager.unsubscribeFromTopic(topic);
    }
  }

  Future<void> updateMessageStatus(
      MessageTable message, MessageStatus messageStatus) async {
    message = message.copyWith(status: messageStatus);
    chatDatabaseCubit.db.updateMessageById(message.id, message);
  }

  Future<void> messagesToRead(MessageTable message,
      {required bool onlyIfMyMessages,
      MessageStatus messageStatus = MessageStatus.READ}) async {
    bool setRead = true;
    if (onlyIfMyMessages && message.userId != JwtPayload.myId) {
      setRead = false;
    }

    if (setRead) {
      await chatDatabaseCubit.db.updateMessagesStatus(message,
          exceptUserId: onlyIfMyMessages ? 0 : JwtPayload.myId,
          messageStatus: messageStatus);
    }
  }

  Future<List<MessageTable>> getMyMessagesByType(
      String chatId, MessageType type,
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
