import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/listeners/message_status.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:ink_mobile/models/chat/texting.dart';
import 'package:ink_mobile/providers/message_provider.dart';

@injectable
class ChatFunctions {
  final ChatDatabaseCubit chatDatabaseCubit;

  const ChatFunctions(this.chatDatabaseCubit);

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

  Future<bool> setMessagesToReadNats(List<MessageTable> messages) async {
    if (UseMessageProvider.initialized) {
      final messageProvider = UseMessageProvider.messageProvider!;
      String chatId = messages.last.chatId;
      final channel =
          messageProvider.natsProvider.getGroupReactedChannelById(chatId);
      bool send = await messageProvider.userReactionSender
          .sendReadMessageStatus(channel, messages);
      await MessageStatusListener.messagesToRead(
          messages, this);
      messageProvider.chatSaver.saveChats(newChat: null);
      return send;
    }
    return false;
  }

  Future<bool> sendTextingMessage(
      String chatId, CustomTexting customTexting) async {
    if (UseMessageProvider.initialized) {
      final messageProvider = UseMessageProvider.messageProvider!;
      final channel =
          messageProvider.natsProvider.getGroupTextingChannelById(chatId);
      bool send = await messageProvider.textSender.sendTextingMessage(
          channel,
          customTexting: customTexting,
          chatId: chatId);
      return send;
    }
    return false;
  }
}
