import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/models/chat/group_chat.dart';
import 'package:ink_mobile/models/chat/message.dart';

class ChatUser {
  String avatarUrl;
  String name;
  bool online;

  ChatUser({
    required this.avatarUrl,
    required this.name,
    this.online = false,
  });

  ChatUser copyWith({
    String? avatarUrl,
    String? name,
    bool? online,
  }) {
    return ChatUser(
      avatarUrl: avatarUrl ?? this.avatarUrl,
      name: name ?? this.name,
      online: online ?? this.online,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatUser &&
        other.avatarUrl == avatarUrl &&
        other.name == name &&
        other.online == online;
  }

  @override
  int get hashCode => avatarUrl.hashCode ^ name.hashCode ^ online.hashCode;
}

class ChatUserViewModel {
  static Chat createSingleChat(ChatUser user,
      {List<Message> messages = const []}) {
    return Chat(
      chatName: user.name,
      avatarUrl: user.avatarUrl,
      messages: messages,
    );
  }

  static Chat createGroup({
    required String name,
    required ChatUser owner,
    required List<ChatUser> users,
  }) {
    return Chat(
      chatName: name,
      avatarUrl: "",
      messages: [],
      group: GroupChat(owner: owner, users: users),
    );
  }

  static bool isOwner(ChatUser user, ChatUser owner) => user == owner;

  static bool isAdmin(ChatUser user, List<ChatUser> admins) {
    for (var admin in admins) if (user == admin) return true;

    return false;
  }
}
