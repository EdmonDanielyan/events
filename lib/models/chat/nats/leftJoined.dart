import 'dart:convert';

import 'package:ink_mobile/models/chat/chat_user.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';

class ChatLeftJoinedFields {
  final ChatTable chat;
  final List<UserTable> users;
  final int senderId;
  final int? countLefts;

  ChatLeftJoinedFields({
    required this.chat,
    required this.users,
    required this.senderId,
    required this.countLefts,
  });

  Map<String, String> toMap() {
    return {
      'chat': chat.toJsonString(),
      'users': ChatUserViewModel.listUsersToString(users),
      'senderId': senderId.toString(),
      'countLefts': countLefts != null ? countLefts.toString() : "",
    };
  }

  factory ChatLeftJoinedFields.fromMap(Map<String, dynamic> map) {
    return ChatLeftJoinedFields(
      chat: ChatTable.fromJson(jsonDecode(map['chat'])),
      users: ChatUserViewModel.getUsersFromString(map['users']),
      senderId: int.tryParse(map["senderId"].toString()) ?? 0,
      countLefts: int.tryParse(map["countLefts"].toString()) ?? null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatLeftJoinedFields.fromJson(String source) =>
      ChatLeftJoinedFields.fromMap(json.decode(source));
}
