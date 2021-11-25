import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/screens/messages/chat/entities/form_entities.dart';

import 'chat_functions.dart';

class SendMessage {
  final ChatDatabaseCubit chatDatabaseCubit;
  final ChatTable chat;

  const SendMessage({
    required this.chatDatabaseCubit,
    required this.chat,
  });

  static MessageTable generateMessage(
    String chatId,
    String message, {
    String? repliedMessageId,
    MessageStatus status = MessageStatus.SENDING,
    MessageType type = MessageType.Text,
  }) {
    return MessageTable(
      id: generateMessageId,
      chatId: chatId,
      message: message,
      userId: JwtPayload.myId,
      read: false,
      sentOn: false,
      status: status,
      created: new DateTime.now(),
      type: type,
      repliedMessageId: repliedMessageId,
    );
  }

  static String get generateMessageId =>
      "${JwtPayload.myId}_${new DateTime.now().microsecondsSinceEpoch}";

  Future<MessageTable> call(ChatEntities entities) async {
    final message = await _sendMessageToDatabase(entities);
    return message;
  }

  Future<MessageTable> _sendMessageToDatabase(ChatEntities chatEntities) async {
    MessageTable message = generateMessage(
      chat.id,
      chatEntities.text,
      repliedMessageId: chatEntities.repliedMessageId,
      type: chatEntities.type,
    );

    await addMessage(message);
    return message;
  }

  Future<String> addMessage(
    MessageTable message,
  ) async {
    final msg = await chatDatabaseCubit.db.selectMessageById(message.id);
    if (msg == null) {
      await chatDatabaseCubit.db.insertMessage(message);
      try {
        ChatFunctions(chatDatabaseCubit).setChatToFirst(chat);
      } catch (_e) {
        print("ERROR");
        print(_e.toString());
      }
    }

    return message.id;
  }

  Future<void> addMessagesIfNotExists(List<MessageTable> messages) async {
    if (messages.isNotEmpty) {
      for (final message in messages) {
        await addMessage(message);
      }
    }
  }

  static MessageTable? joinedLeftMessage(
      {required String chatId,
      required String userName,
      required MessageType type}) {
    bool isJoined = type == MessageType.UserJoined;
    bool isLeft = type == MessageType.UserLeftChat;
    if (isJoined || isLeft) {
      String action = isJoined
          ? localizationInstance.joinedChat
          : localizationInstance.leftChat;

      final text = "$userName $action";

      return generateMessage(chatId, text,
          status: MessageStatus.EMPTY, type: type);
    }
    return null;
  }
}
