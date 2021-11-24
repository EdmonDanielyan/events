import 'dart:convert';

import 'package:ink_mobile/models/chat/database/chat_db.dart';

class ChatInfoFields {
  final String channel;
  final ChatTable chat;
  final UserTable user;

  ChatInfoFields({
    required this.channel,
    required this.chat,
    required this.user,
  });

  Map<String, String> toMap() {
    return {
      'channel': channel,
      'chat': chat.toJsonString(),
      'user': user.toJsonString(),
    };
  }

  factory ChatInfoFields.fromMap(Map<String, dynamic> map) {
    return ChatInfoFields(
      channel: map['channel'],
      chat: ChatTable.fromJson(jsonDecode(map['chat'])),
      user: UserTable.fromJson(jsonDecode(map['user'])),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatInfoFields.fromJson(String source) =>
      ChatInfoFields.fromMap(json.decode(source));
}
