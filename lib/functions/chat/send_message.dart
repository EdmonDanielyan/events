import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/screens/messages/chat/entities/form_entities.dart';

import 'chat_functions.dart';

@injectable
class SendMessage with Loggable {
  final ChatDatabaseCubit chatDatabaseCubit;

  final ChatFunctions chatFunctions;

  SendMessage({required this.chatFunctions, required this.chatDatabaseCubit});

  MessageTable _generateMessage(
    String chatId,
    String message, {
    String? repliedMessageId,
    MessageStatus status = MessageStatus.SENDING,
    MessageType type = MessageType.Text,
    DateTime? created,
  }) {
    return MessageTable(
      id: generateMessageId,
      chatId: chatId,
      message: message,
      userId: JwtPayload.myId,
      read: false,
      sentOn: false,
      status: status,
      created: created ?? new DateTime.now(),
      type: type,
      repliedMessageId: repliedMessageId,
    );
  }

  String get generateMessageId =>
      "${JwtPayload.myId}_${new DateTime.now().microsecondsSinceEpoch}";

  Future<MessageTable> call(ChatTable chat, ChatEntities entities) async {
    final message = await _sendMessageToDatabase(chat, entities);
    return message;
  }

  Future<MessageTable> _sendMessageToDatabase(
      ChatTable chat, ChatEntities chatEntities) async {
    MessageTable message = _generateMessage(
      chat.id,
      chatEntities.text,
      repliedMessageId: chatEntities.repliedMessageId,
      type: chatEntities.type,
    );

    await addMessage(chat, message);
    return message;
  }

  Future<String> addMessage(ChatTable chat, MessageTable message,
      {bool setChatToFirst = true}) async {
    final msg = await chatDatabaseCubit.db.selectMessageById(message.id);
    if (msg == null) {
      await chatDatabaseCubit.db.insertMessage(message);
      if (setChatToFirst) {
        try {
          chatFunctions.setChatToFirst(chat);
        } catch (e, stack) {
          logger.severe("addMessage error", e, stack);
        }
      }
    }

    return message.id;
  }

  Future<void> addMessagesIfNotExists(
      ChatTable chat, List<MessageTable> messages) async {
    if (messages.isNotEmpty) {
      for (final message in messages) {
        await addMessage(chat, message);
      }
    }
  }

  Future<void> insertMultipleMessages(List<MessageTable> messages) async {
    await chatDatabaseCubit.db.insertMultipleMessages(messages);
  }

  MessageTable? joinedLeftMessage({
    required String chatId,
    required String userName,
    required MessageType type,
    required DateTime created,
  }) {
    bool isJoined = type == MessageType.UserJoined;
    bool isLeft = type == MessageType.UserLeftChat;
    if (isJoined || isLeft) {
      String action = isJoined
          ? localizationInstance.joinedChat
          : localizationInstance.leftChat;

      final text = "$userName $action";

      return _generateMessage(
        chatId,
        text,
        status: MessageStatus.EMPTY,
        type: type,
        created: created,
      );
    }
    return null;
  }
}
