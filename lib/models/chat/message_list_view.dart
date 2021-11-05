import 'dart:convert';

import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/screens/messages/chat/entities/form_entities.dart';

import 'database/chat_db.dart';

enum MessageStatus { SENDING, SENT, READ, ERROR }

class MessageListView {
  static bool isByMe(MessageTable msg, {int? myId}) {
    myId = myId ?? JwtPayload.myId;
    return msg.userId == myId;
  }

  static Map<String, dynamic> toJson(MessageTable message) {
    final json = message.toJson();
    json["status"] = messageStatusToString(json["status"]);
    return json;
  }

  static String toJsonString(MessageTable message) {
    return jsonEncode(toJson(message));
  }

  static MessageTable fromJson(Map<String, dynamic> json) {
    json["status"] = messageStatusStringToObject(json["status"]);
    return MessageTable.fromJson(json) as MessageTable;
  }

  static MessageTable fromString(String str) {
    return fromJson(jsonDecode(str));
  }

  static String messageStatusToString(dynamic json) {
    return "${json}";
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

  static MessageType getType(ChatEntities entities) {
    if (entities.files != null && entities.files!.length > 0)
      return MessageType.Document;

    return MessageType.Text;
  }

  static List<MessageTable> makeMessagesSendOn(List<MessageTable> messages) {
    // messages = messages
    //     .map((element) => element.copyWith(byMe: true, sentOn: true))
    //     .toList();
    // messages.sort(sortByDateReverse);
    return messages;
  }

  static List<MessageTable> getSelectedItems(List<MessageTable> items) => [];
  //items.where((element) => element.selected == true).toList();

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

  static int unreadMessages(List<MessageWithUser> items) =>
      items.fold(0, (previousValue, element) {
        return element.message!.status != MessageStatus.READ &&
                !isByMe(element.message!)
            ? previousValue + 1
            : previousValue + 0;
      });
}
