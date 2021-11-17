import 'dart:convert';

import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/token.dart';

import 'chat_list_view.dart';
import 'database/model/message_with_user.dart';

class ChatUserViewModel {
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

  static ParticipantTable toParticipant(ChatTable chat, UserTable user,
      {bool admin = false}) {
    return ParticipantTable(chatId: chat.id, userId: user.id, admin: admin);
  }

  static List<ParticipantTable> toParticipants(
      List<UserTable> users, ChatTable chat) {
    List<ParticipantTable> participants = [];

    for (final user in users) {
      participants.add(toParticipant(chat, user));
    }

    return participants;
  }

  static Future<UserTable?> getUserForChatList(
    ChatTable chat,
    ChatDatabaseCubit chatDatabaseCubit, {
    List<MessageWithUser>? messages,
    int? userId,
  }) async {
    if (ChatListView.isGroup(chat) && messages != null) {
      return messages.last.user;
    }

    if (userId == null) {
      userId = JwtPayload.myId;
    }

    int oppositeId = getOppositeUserIdFromChat(chat)!;

    return await chatDatabaseCubit.db.selectUserById(oppositeId);
  }

  static int? getOppositeUserIdFromChat(ChatTable chat, {int? userId}) {
    if (!ChatListView.isGroup(chat)) {
      if (userId == null) userId = JwtPayload.myId;

      return chat.ownerId == userId ? chat.participantId! : chat.ownerId;
    }

    return null;
  }
}
