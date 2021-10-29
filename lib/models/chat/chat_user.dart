import 'dart:convert';

import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/token.dart';

class ChatUser {
  int id;
  String avatarUrl;
  String name;
  bool online;

  bool selected = false;

  ChatUser({
    required this.id,
    required this.avatarUrl,
    required this.name,
    this.online = false,
  });

  ChatUser copyWith({
    int? id,
    String? avatarUrl,
    String? name,
    bool? online,
  }) {
    return ChatUser(
      id: id ?? this.id,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      name: name ?? this.name,
      online: online ?? this.online,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatUser &&
        other.id == id &&
        other.avatarUrl == avatarUrl &&
        other.name == name &&
        other.online == online;
  }

  @override
  int get hashCode {
    return id.hashCode ^ avatarUrl.hashCode ^ name.hashCode ^ online.hashCode;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'avatarUrl': avatarUrl,
      'name': name,
      'online': online,
    };
  }

  factory ChatUser.fromMap(Map<String, dynamic> map) {
    return ChatUser(
      id: map['id'],
      avatarUrl: map['avatarUrl'],
      name: map['name'],
      online: map['online'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatUser.fromJson(String source) =>
      ChatUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatUser(id: $id, avatarUrl: $avatarUrl, name: $name, online: $online)';
  }
}

class ChatUserViewModel {
  static bool isOwner(ChatUser user, ChatUser owner) => user == owner;

  static bool isAdmin(ChatUser user, List<ChatUser> admins) {
    for (var admin in admins) if (user == admin) return true;

    return false;
  }
}
