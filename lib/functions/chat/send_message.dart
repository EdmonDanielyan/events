import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:ink_mobile/models/chat/person_list_params.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/screens/messages/chat/entities/form_entities.dart';
import 'package:uuid/uuid.dart';

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
    int? userId,
    int? sequence,
  }) {
    return MessageTable(
      id: generateMessageId,
      chatId: chatId,
      message: message,
      messageToLower: message.toLowerCase(),
      userId: userId ?? JwtPayload.myId,
      read: false,
      sentOn: false,
      status: status,
      created: created?.millisecondsSinceEpoch ?? DateTime.now().millisecondsSinceEpoch,
      type: type,
      repliedMessageId: repliedMessageId,
      sequence: sequence ?? 0,
    );
  }

  String get generateMessageId => Uuid().v4();

  Future<MessageTable> save(ChatTable chat, ChatEntities entities) async {
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
      created: DateTime.now(),
      sequence: 500000 + chatEntities.seq,
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
          final newChat = await chatDatabaseCubit.db.selectChatById(chat.id);
          if (newChat != null) {
            chatFunctions.setChatToFirst(newChat);
          }
        } catch (e, stack) {
          logger.severe("addMessage error", e, stack);
        }
      }
    }

    return message.id;
  }

  Future<void> insertMultipleMessages(List<MessageTable> messages) async {
    await chatDatabaseCubit.db.insertMultipleMessages(messages);
  }

  MessageTable? joinedLeftMessage({
    required String chatId,
    required String userName,
    required MessageType type,
    required DateTime createdUtc,
    required int userId,
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
        created: createdUtc,
        userId: userId,
      );
    }
    return null;
  }

  void sendOn(List<MessageTable> messages, BuildContext context) {
    Future.delayed(Duration(milliseconds: 200), () {
      Navigator.of(context).pushNamed(
        "/message_person_list",
        arguments: PersonListParams(
          messages: messages,
          title: localizationInstance.sendOn,
          type: PersonListParamsEnum.SEND_ON,
        ),
      );
    });
  }
}
