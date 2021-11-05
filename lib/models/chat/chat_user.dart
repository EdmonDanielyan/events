import 'dart:convert';

import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/token.dart';

class ChatUserViewModel {
  static bool isOwner(UserTable user, UserTable owner) => user == owner;

  static bool isAdmin(UserTable user, List<UserTable> admins) {
    for (var admin in admins) if (user == admin) return true;

    return false;
  }

  static List<UserTable> getUsersFromString(String data) {
    List<UserTable> users = [];

    final items = jsonDecode(data) as List<dynamic>;

    for (final item in items) {
      users.add(UserTable.fromJson(jsonDecode(item)));
    }

    return users;
  }

  static String listUsersToString(List<UserTable> users) {
    List<String> object = [];

    for (final user in users) {
      object.add(user.toJsonString());
    }

    return jsonEncode(object);
  }

  static UserTable getOwnerFromList(ChatTable chat, List<UserTable> users) {
    return users.firstWhere((element) => element.id == chat.ownerId);
  }

  static UserTable getOppositeUser(List<UserTable> users) {
    return users.firstWhere((element) => element.id != JwtPayload.myId);
  }

  static UserTable getNotOwnerFromList(ChatTable chat, List<UserTable> users) {
    return users.firstWhere((element) => element.id != chat.ownerId);
  }
}
