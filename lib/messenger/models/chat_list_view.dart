import 'dart:convert';

import 'package:ink_mobile/messenger/extensions/chat_table.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/nats/invitation.dart';

import 'chat_user.dart';

class ChatListView {
  static int sortChats(ChatTable a, ChatTable b) {
    return a.updatedAt.compareTo(b.updatedAt);
  }

  static ChatTable changeChatForParticipant(
      ChatTable chat, List<UserTable> users) {
    if (!chat.isGroup()) {
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

  static List<ChatTable> searchChats(String value, List<ChatTable> chats) {
    List<ChatTable> newChats = [];
    newChats = chats.where((element) {
      bool containsChatName = strContainsValue(element.name, value);

      return containsChatName;
    }).toList();
    newChats.sort((a, b) {
      return a.description.compareTo(b.description);
    });

    return newChats;
  }
}
