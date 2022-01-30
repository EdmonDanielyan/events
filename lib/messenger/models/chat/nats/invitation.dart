import 'dart:convert';

import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat_user.dart';

class ChatInvitationFields {
  final ChatTable chat;
  final List<UserTable> users;

  ChatInvitationFields({
    required this.chat,
    required this.users,
  });

  Map<String, String> toMap() {
    return {
      'chat': chat.toJsonString(),
      'users': ChatUserViewModel.listUsersToString(users),
    };
  }

  factory ChatInvitationFields.fromMap(Map<String, dynamic> map) {
    return ChatInvitationFields(
      chat: ChatTable.fromJson(jsonDecode(map['chat'])),
      users: ChatUserViewModel.getUsersFromString(map['users']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatInvitationFields.fromJson(String source) =>
      ChatInvitationFields.fromMap(json.decode(source));
}
