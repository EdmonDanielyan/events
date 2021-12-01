import 'dart:convert';

import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats/invitation.dart';
import 'package:ink_mobile/models/token.dart';

import 'chat_user.dart';

class ChatListView {
  static bool isGroup(ChatTable chat) => chat.participantId == null;
  static bool isOwner(ChatTable chat, {int? myId}) {
    myId = myId ?? JwtPayload.myId;
    return chat.ownerId == myId;
  }

  static String getChatIdBetweenUsers(List<UserTable> users) {
    List<String> ids = [];
    users.sort((a, b) {
      return a.id.compareTo(b.id);
    });

    for (final user in users) {
      ids.add(user.id.toString());
    }

    return ids.join("_");
  }

  static ChatTable changeChatForParticipant(
      ChatTable chat, List<UserTable> users) {
    if (!ChatListView.isGroup(chat)) {
      UserTable oppositeUser = ChatUserViewModel.getOppositeUser(users);
      chat = chat.copyWith(
        name: oppositeUser.name,
        avatar: oppositeUser.avatar,
      );
    }
    return chat;
  }

  static bool strContainsValue(String str, String value) =>
      str.toLowerCase().contains(value.toLowerCase());

  static String listChatsToString(List<ChatTable> chats) {
    List<String> object = [];

    for (final chat in chats) {
      object.add(chat.toJsonString());
    }

    return jsonEncode(object);
  }

  static List<ChatTable> getChatsFromString(String data) {
    List<ChatTable> chats = [];

    final items = jsonDecode(data) as List<dynamic>;

    for (final item in items) {
      chats.add(ChatTable.fromJson(jsonDecode(item)));
    }

    return chats;
  }

  static String listChatsWithParticipantsToString(
      List<ChatInvitationFields> chats) {
    List<String> object = [];

    for (final chat in chats) {
      object.add(chat.toJson());
    }

    return jsonEncode(object);
  }

  static List<ChatInvitationFields> listChatsFromString(String data) {
    List<ChatInvitationFields> chats = [];

    final items = jsonDecode(data) as List<dynamic>;

    for (final item in items) {
      chats.add(ChatInvitationFields.fromJson(jsonDecode(item)));
    }

    return chats;
  }
}