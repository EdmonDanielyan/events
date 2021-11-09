import 'dart:convert';

import 'package:ink_mobile/models/chat/database/chat_db.dart';

import '../message_list_view.dart';

class ChatMessageStatusFields {
  final int senderId;
  final List<MessageTable> messages;

  ChatMessageStatusFields({
    required this.senderId,
    required this.messages,
  });

  Map<String, String> toMap() {
    return {
      'senderId': senderId.toString(),
      'messages': MessageListView.listMessagesToString(messages),
    };
  }

  factory ChatMessageStatusFields.fromMap(Map<String, dynamic> map) {
    return ChatMessageStatusFields(
      senderId: int.tryParse(map["senderId"].toString()) ?? 0,
      messages: MessageListView.getMessagesFromString(map['messages']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessageStatusFields.fromJson(String source) =>
      ChatMessageStatusFields.fromMap(json.decode(source));
}
