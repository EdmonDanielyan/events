import 'dart:convert';

import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/models/chat/chat_user.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/screens/messages/chat/entities/form_entities.dart';

enum MessageStatus { SENDING, SENT, READ, ERROR }

class Message {
  final int id;
  final ChatUser user;
  final String message;
  final DateTime messageDate;
  final MessageType type;
  final MessageStatus status;
  final int? selectedMessageId;
  final bool sentOn;
  final bool byMe;

  bool selected = false;

  Message({
    required this.id,
    required this.user,
    required this.message,
    required this.messageDate,
    this.type = MessageType.Text,
    this.status = MessageStatus.ERROR,
    this.selectedMessageId,
    this.sentOn = false,
    this.byMe = false,
    this.selected = false,
  });

  Message copyWith({
    int? id,
    ChatUser? user,
    String? message,
    DateTime? messageDate,
    MessageType? type,
    MessageStatus? status,
    int? selectedMessageId,
    bool? sentOn,
    bool? byMe,
    bool? selected,
  }) {
    return Message(
      id: id ?? this.id,
      user: user ?? this.user,
      message: message ?? this.message,
      messageDate: messageDate ?? this.messageDate,
      type: type ?? this.type,
      status: status ?? this.status,
      selectedMessageId: selectedMessageId ?? this.selectedMessageId,
      sentOn: sentOn ?? this.sentOn,
      byMe: byMe ?? this.byMe,
      selected: selected ?? this.selected,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Message &&
        other.id == id &&
        other.user == user &&
        other.message == message &&
        other.messageDate == messageDate &&
        other.type == type &&
        other.status == status &&
        other.selectedMessageId == selectedMessageId &&
        other.sentOn == sentOn &&
        other.byMe == byMe &&
        other.selected == selected;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user.hashCode ^
        message.hashCode ^
        messageDate.hashCode ^
        type.hashCode ^
        status.hashCode ^
        selectedMessageId.hashCode ^
        sentOn.hashCode ^
        byMe.hashCode ^
        selected.hashCode;
  }
}

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
    return MessageTable.fromJson(json);
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

  static List<Message> makeMessagesSendOn(List<Message> messages) {
    messages = messages
        .map((element) => element.copyWith(byMe: true, sentOn: true))
        .toList();
    messages.sort(sortByDateReverse);
    return messages;
  }

  static List<Message> getSelectedItems(List<Message> items) =>
      items.where((element) => element.selected == true).toList();

  static List<Message> searchMessagesByStr(
      String value, List<Message> messages) {
    List<Message> search = [];
    if (value.trim().isNotEmpty) {
      search = messages.where((element) {
        bool byBody =
            element.message.toLowerCase().contains(value.toLowerCase());

        return byBody;
      }).toList();
    }
    return search;
  }

  static Message? getMessageById(int id, List<Message> messages) {
    for (final message in messages) if (message.id == id) return message;

    return null;
  }

  static int unreadMessages(List<MessageWithUser> items) =>
      items.fold(0, (previousValue, element) {
        return element.message!.status != MessageStatus.READ &&
                !isByMe(element.message!)
            ? previousValue + 1
            : previousValue + 0;
      });

  static int sortByDateReverse(Message a, Message b) =>
      a.messageDate.isAfter(b.messageDate) ? 1 : -1;
}
