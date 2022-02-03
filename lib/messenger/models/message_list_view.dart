import 'dart:convert';

import 'package:collection/collection.dart' show IterableExtension;
import 'package:ink_mobile/extensions/message_table.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/messenger/models/chat/database/tables/db_enum.dart';
import 'package:ink_mobile/models/token.dart';

class MessageListView {
  static List<StoredMessageType> notIgnoringHoverTypes = [
    StoredMessageType.TEXT,
    StoredMessageType.DOCUMENT
  ];

  static Map<String, dynamic> toJson(MessageTable message) {
    final json = message.toJson();
    json["sentStatus"] = (json["sentStatus"] as MessageSentStatus).toJson();
    json["actionsStatus"] = (json["actionsStatus"] as MessageActions).toJson();
    json["type"] = (json["type"] as StoredMessageType).toJson();
    return json;
  }

  static String toJsonString(MessageTable message) {
    return jsonEncode(toJson(message));
  }

  static MessageTable fromJson(Map<String, dynamic> json) {
    return MessageTable.fromJson(json);
  }

  static MessageTable fromString(String str) {
    var json = jsonDecode(str);
    json["sentStatus"] = toMessageSentStatus(json["sentStatus"]);
    json["actionsStatus"] = toMessageActions(json["actionsStatus"]);
    json["type"] = toStoredMessageType(json["type"]);
    return fromJson(json);
  }

  static String messageEnumToString(dynamic json) {
    return "$json";
  }

  static MessageSentStatus messageStatusStringToObject(String json) {
    for (final value in MessageSentStatus.values) {
      if (json
          .toString()
          .toLowerCase()
          .contains(value.toString().toLowerCase())) {
        return value;
      }
    }
    return MessageSentStatus.ERROR;
  }

  static StoredMessageType messageTypeStringToEnum(String json) {
    for (final value in StoredMessageType.values) {
      if (json
          .toString()
          .toLowerCase()
          .contains(value.toString().toLowerCase())) {
        return value;
      }
    }
    return StoredMessageType.TEXT;
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
        return !element.message!.read &&
                notIgnoringHoverTypes.contains(element.message?.type) &&
                !element.message!.isByMe()
            ? previousValue + 1
            : previousValue + 0;
      });

  static int unreadMessagesByMessages(List<MessageTable> items) =>
      items.fold(0, (previousValue, element) {
        return !element.read &&
                notIgnoringHoverTypes.contains(element.type) &&
                !element.isByMe()
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
        message: txt,
        messageToLower: txt.toLowerCase(),
        actionsStatus: MessageActions.EDITED);
  }

  static MessageTable renewMessage(
    MessageTable message, {
    String? id,
    int? userId,
    ChatTable? newChat,
    bool? forwarded,
  }) {
    MessageTable newMessage = message.copyWith(
      id: id ?? message.id,
      userId: userId ?? JwtPayload.myId,
      repliedMessageId: "",
      sentStatus: MessageSentStatus.SENDING,
      timestamp: DateTime.now(),
    );

    if (newChat != null) newMessage = newMessage.copyWith(chatId: newChat.id);

    if (forwarded != null)
      newMessage = newMessage.copyWith(actionsStatus: MessageActions.FORWARDED);

    return newMessage;
  }

  static MessageTable? oppositeNotReadMessage(List<MessageTable> items) {
    return items
        .lastWhereOrNull((element) => !element.isByMe() && !element.read);
  }

  static List<MessageTable> oppositeNotReadMessages(List<MessageTable> items) {
    return items
        .where((element) => !element.isByMe() && !element.read)
        .toList();
  }

  static List<MessageTable> notReadMessages(List<MessageTable> items) {
    return items.where((element) => !element.read).toList();
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
