import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/screens/messages/chat/entities/form_entities.dart';

import 'database/chat_db.dart';
import 'package:collection/collection.dart' show IterableExtension;
import 'package:ink_mobile/extensions/message_table.dart';

enum MessageStatus { EMPTY, SENDING, SENT, READ, ERROR }

class MessageListView {
  static List<MessageType> notIgnoringHoverTypes = [
    MessageType.Text,
    MessageType.Document
  ];

  static Map<String, dynamic> toJson(MessageTable message) {
    final json = message.toJson();
    json["status"] = messageEnumToString(json["status"]);
    json["type"] = messageEnumToString(json["type"]);
    return json;
  }

  static String toJsonString(MessageTable message) {
    return jsonEncode(toJson(message));
  }

  static MessageTable fromJson(Map<String, dynamic> json) {
    json["status"] = messageStatusStringToObject(json["status"]);
    json["type"] = messageTypeStringToEnum(json["type"]);
    return MessageTable.fromJson(json);
  }

  static MessageTable fromString(String str) {
    return fromJson(jsonDecode(str));
  }

  static String messageEnumToString(dynamic json) {
    return "$json";
  }

  static MessageStatus messageStatusStringToObject(String json) {
    for (final value in MessageStatus.values) {
      if (json
          .toString()
          .toLowerCase()
          .contains(value.toString().toLowerCase())) {
        return value;
      }
    }
    return MessageStatus.ERROR;
  }

  static MessageType messageTypeStringToEnum(String json) {
    for (final value in MessageType.values) {
      if (json
          .toString()
          .toLowerCase()
          .contains(value.toString().toLowerCase())) {
        return value;
      }
    }
    return MessageType.Text;
  }

  static MessageType getType(ChatEntities entities) {
    if (entities.files != null && entities.files!.length > 0)
      return MessageType.Document;

    return MessageType.Text;
  }

  static MessageType? getTypeByChannel(String channel) {
    for (final value in MessageType.values) {
      final channelComparing = channel.toLowerCase();
      final valueToComparing = describeEnum(value).toLowerCase();
      if (channelComparing.contains(valueToComparing)) {
        return value;
      }
    }
    return null;
  }

  static List<MessageTable> searchMessagesByStr(
      String value, List<MessageTable> messages) {
    List<MessageTable> search = [];
    if (value.trim().isNotEmpty) {
      search = messages.where((element) {
        bool byBody =
            element.message.toLowerCase().contains(value.toLowerCase());

        return byBody;
      }).toList();
    }
    return search;
  }

  static int unreadMessagesByMessageWithUser(List<MessageWithUser> items) =>
      items.fold(0, (previousValue, element) {
        return element.message!.status != MessageStatus.READ &&
                !element.message!.isByMe()
            ? previousValue + 1
            : previousValue + 0;
      });

  static int unreadMessagesByMessages(List<MessageTable> items) =>
      items.fold(0, (previousValue, element) {
        return element.status != MessageStatus.READ && !element.isByMe()
            ? previousValue + 1
            : previousValue + 0;
      });

  static List<MessageTable> messageWithUsersToMessage(
      List<MessageWithUser> items) {
    List<MessageTable> messages = [];
    for (final messageWithUser in items) {
      if (messageWithUser.message != null) {
        messages.add(messageWithUser.message!);
      }
    }

    return messages;
  }

  static MessageTable editMessage(MessageTable message, String txt) {
    return message.copyWith(
        message: txt, messageToLower: txt.toLowerCase(), edited: true);
  }

  static MessageTable renewMessage(
    MessageTable message, {
    String? id,
    int? userId,
    ChatTable? newChat,
    bool? sentOn,
  }) {
    MessageTable newMessage = message.copyWith(
      id: id ?? message.id,
      userId: userId ?? JwtPayload.myId,
      repliedMessageId: "",
      status: MessageStatus.SENDING,
      created: new DateTime.now(),
    );

    if (newChat != null) newMessage = newMessage.copyWith(chatId: newChat.id);

    if (sentOn != null) newMessage = newMessage.copyWith(sentOn: sentOn);

    return newMessage;
  }

  static MessageTable? oppositeNotReadMessage(List<MessageTable> items) {
    return items.lastWhereOrNull(
        (element) => !element.isByMe() && element.status != MessageStatus.READ);
  }

  static List<MessageTable> oppositeNotReadMessages(List<MessageTable> items) {
    return items
        .where((element) =>
            !element.isByMe() && element.status != MessageStatus.READ)
        .toList();
  }

  static List<MessageTable> notReadMessages(List<MessageTable> items) {
    return items
        .where((element) => element.status != MessageStatus.READ)
        .toList();
  }

  static String listMessagesToString(List<MessageTable> messages) {
    List<String> object = [];

    for (final message in messages) {
      object.add(toJsonString(message));
    }

    return jsonEncode(object);
  }

  static List<MessageTable> getMessagesFromString(String data) {
    List<MessageTable> messages = [];
    try {
      final items = jsonDecode(data) as List<dynamic>;

      for (final item in items) {
        messages.add(MessageListView.fromString(item));
      }
    } on NoSuchMethodError {}

    return messages;
  }

  static List<MessageTable> getUserMessages(
      List<MessageTable> items, int userId) {
    List<MessageTable> messages = [];

    if (items.isNotEmpty) {
      for (final item in items) {
        if (item.isByMe(myId: userId)) {
          messages.add(item);
        }
      }
    }

    return messages;
  }
}
