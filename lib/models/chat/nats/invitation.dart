import 'dart:convert';

import 'package:ink_mobile/models/chat/chat_user.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';

class ChatInvitationFields {
  final String channel;
  final ChatTable chat;
  final List<UserTable> users;

  ChatInvitationFields({
    required this.channel,
    required this.chat,
    required this.users,
  });

  Map<String, String> toMap() {
    return {
      'channel': channel,
      'chat': chat.toJsonString(),
      'users': ChatUserViewModel.listUsersToString(users),
    };
  }

  factory ChatInvitationFields.fromMap(Map<String, dynamic> map) {
    return ChatInvitationFields(
      channel: map['channel'],
      chat: ChatTable.fromJson(jsonDecode(map['chat'])),
      users: ChatUserViewModel.getUsersFromString(map['users']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatInvitationFields.fromJson(String source) =>
      ChatInvitationFields.fromMap(json.decode(source));
}
