import 'dart:convert';

import 'package:ink_mobile/models/chat/database/chat_db.dart';

class UserOnlineFields {
  final UserTable user;

  UserOnlineFields({
    required this.user,
  });

  Map<String, String> toMap() {
    return {
      'user': user.toJsonString(),
    };
  }

  factory UserOnlineFields.fromMap(Map<String, dynamic> map) {
    return UserOnlineFields(
      user: UserTable.fromJson(jsonDecode(map['user'])),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserOnlineFields.fromJson(String source) =>
      UserOnlineFields.fromMap(json.decode(source));
}
