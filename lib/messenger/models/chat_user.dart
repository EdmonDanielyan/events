import 'dart:convert';

import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/extensions/chat_table.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/models/birthday_data.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:remove_emoji/remove_emoji.dart';

class ChatUserViewModel {
  static bool isAdmin(UserTable user, List<UserTable> admins) {
    for (var admin in admins) if (user == admin) return true;

    return false;
  }

  static List<UserTable> getUsersFromString(String data) {
    List<UserTable> users = [];

    try {
      final items = jsonDecode(data) as List<dynamic>;

      for (final item in items) {
        users.add(UserTable.fromJson(jsonDecode(item)));
      }
    } on NoSuchMethodError {
      //DATA IS EMPTY
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
    if (chat.isGroup() && messages != null) {
      return messages.last.user;
    }

    if (userId == null) {
      userId = JwtPayload.myId;
    }

    int oppositeId = getOppositeUserIdFromChat(chat)!;

    return await chatDatabaseCubit.db.selectUserById(oppositeId);
  }

  static int? getOppositeUserIdFromChat(ChatTable chat, {int? userId}) {
    if (!chat.isGroup()) {
      if (userId == null) userId = JwtPayload.myId;

      return chat.ownerId == userId ? chat.participantId! : chat.ownerId;
    }

    return null;
  }

  static String listParticipantsToString(List<ParticipantTable> participants) {
    List<String> object = [];

    for (final participant in participants) {
      object.add(participant.toJsonString());
    }

    return jsonEncode(object);
  }

  static List<ParticipantTable> getParticipantsFromString(String data) {
    List<ParticipantTable> participants = [];

    try {
      final items = jsonDecode(data) as List<dynamic>;

      for (final item in items) {
        participants.add(ParticipantTable.fromJson(jsonDecode(item)));
      }
    } on NoSuchMethodError {
      //DATA IS EMPTY
    }

    return participants;
  }

  static String cutName(String name) {
    String newName = name.removemoji;
    final splitName = newName.split(" ");
    if (splitName.length >= 2 &&
        splitName[0].length > 1 &&
        splitName[1].length > 1) {
      newName = "${splitName[0][0]}${splitName[1][0]}".trim();
    } else if (name.length >= 2) {
      newName = "${name[0]}${name[1]}".trim();
    }

    return newName;
  }

  static UserTable userDataToUserTable(UserProfileData user) {
    String name = user.name ?? "";
    if (user.lastName != null) {
      name = "$name ${user.lastName}".trim();
    }
    return UserTable(
      id: user.id,
      name: name,
      avatar: user.pathToAvatar ?? "",
    );
  }

  static UserTable birthdayDataToUserTable(BirthdayData user) {
    String name = (user.name ?? "").trim();
    return UserTable(
      id: user.id,
      name: name,
      avatar: user.pathToAvatar ?? "",
    );
  }
}
