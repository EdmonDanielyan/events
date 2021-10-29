import 'package:flutter/foundation.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/group_chat.dart';
import 'package:ink_mobile/models/chat/message.dart';
import 'package:ink_mobile/models/token.dart';

class Chat {
  final String chatName;
  final String avatarUrl;
  final List<Message> messages;
  final GroupChat? group;

  const Chat({
    this.chatName = "",
    required this.avatarUrl,
    required this.messages,
    this.group,
  });

  Chat copyWith({
    String? chatName,
    String? avatarUrl,
    List<Message>? messages,
    GroupChat? group,
  }) {
    return Chat(
      chatName: chatName ?? this.chatName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      messages: messages ?? this.messages,
      group: group ?? this.group,
    );
  }

  @override
  String toString() {
    return 'Chat(chatName: $chatName, avatarUrl: $avatarUrl, messages: $messages, group: $group)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Chat &&
        other.chatName == chatName &&
        other.avatarUrl == avatarUrl &&
        listEquals(other.messages, messages) &&
        other.group == group;
  }

  @override
  int get hashCode {
    return chatName.hashCode ^
        avatarUrl.hashCode ^
        messages.hashCode ^
        group.hashCode;
  }
}

class ChatListView {
  static bool isGroup(ChatTable chat) => chat.participantId == null;
  static bool isOwner(ChatTable chat, {int? myId}) {
    myId = myId ?? JwtPayload.myId;
    return chat.ownerId == myId;
  }

  static bool strContainsValue(String str, String value) =>
      str.toLowerCase().contains(value.toLowerCase());

  static List<Chat> searchChats(String value, List<Chat> chats) {
    List<Chat> newChats = [];
    newChats = chats.where((element) {
      bool messagesNotEmpty = element.messages.isNotEmpty;
      bool containsChatName = strContainsValue(element.chatName, value);
      bool containsUserName = messagesNotEmpty &&
          strContainsValue(element.messages.last.user.name, value);
      bool containsMessage = messagesNotEmpty &&
          strContainsValue(element.messages.last.message, value);

      return containsChatName || containsUserName || containsMessage;
    }).toList();

    return newChats;
  }
}
