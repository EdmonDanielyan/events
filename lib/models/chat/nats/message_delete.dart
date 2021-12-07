import 'dart:convert';

import 'package:ink_mobile/models/chat/database/chat_db.dart';

import '../message_list_view.dart';

class ChatMessageDeleteFields {
  final UserTable user;
  final List<MessageTable> messages;
  final bool edited;

  ChatMessageDeleteFields({
    required this.user,
    required this.messages,
    required this.edited,
  });

  Map<String, String> toMap() {
    return {
      'messages': MessageListView.listMessagesToString(messages),
      'user': user.toJsonString(),
      'edited': edited.toString(),
    };
  }

  factory ChatMessageDeleteFields.fromMap(Map<String, dynamic> map) {
    return ChatMessageDeleteFields(
      messages: MessageListView.getMessagesFromString(map['messages']),
      user: UserTable.fromJson(jsonDecode(map['user'])),
      edited: map['edited'].toString().toLowerCase() == 'true',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessageDeleteFields.fromJson(String source) =>
      ChatMessageDeleteFields.fromMap(json.decode(source));
}
