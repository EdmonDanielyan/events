import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/cases/chat_functions.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/database/tables/db_enum.dart';
import 'package:ink_mobile/messenger/models/person_list_params.dart';
import 'package:ink_mobile/messenger/screens/chat/entities/form_entities.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:uuid/uuid.dart';

@injectable
class SendMessage with Loggable {
  final ChatDatabaseCubit chatDatabaseCubit;

  final ChatFunctions chatFunctions;

  SendMessage({required this.chatFunctions, required this.chatDatabaseCubit});

  MessageTable _generateMessage(
    String chatId,
    String message, {
    String? repliedMessageId,
    MessageSentStatus status = MessageSentStatus.SENDING,
    StoredMessageType type = StoredMessageType.TEXT,
    actionsStatus = MessageActions.EMPTY,
    DateTime? timestamp,
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
      sentStatus: status,
      timestamp: timestamp ?? DateTime.now(),
      repliedMessageId: repliedMessageId,
      sequence: sequence ?? 0,
      actionsStatus: actionsStatus,
      type: type,
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
      timestamp: DateTime.now(),
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

  MessageTable? joinedLeftMessage(
      {required String chatId,
      required String userName,
      required StoredMessageType type,
      required DateTime timestampUtc,
      required int userId,
      required int sequence}) {
    bool isJoined = type == StoredMessageType.USER_JOINED;
    bool isLeft = type == StoredMessageType.USER_LEFT;
    if (isJoined || isLeft) {
      String action = isJoined
          ? localizationInstance.joinedChat
          : localizationInstance.leftChat;

      final text = "$userName $action";

      return _generateMessage(chatId, text,
          type: type,
          timestamp: timestampUtc,
          userId: userId,
          sequence: sequence,
          actionsStatus: MessageActions.EMPTY,
          status: MessageSentStatus.EMPTY);
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