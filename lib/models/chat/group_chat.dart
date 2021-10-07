import 'package:flutter/foundation.dart';
import 'package:ink_mobile/models/chat/chat_user.dart';

class GroupChat {
  final ChatUser owner;
  final List<ChatUser> admins;
  final List<ChatUser> users;
  final String description;

  GroupChat({
    required this.owner,
    this.admins = const [],
    required this.users,
    this.description = "",
  });

  GroupChat copyWith({
    ChatUser? owner,
    List<ChatUser>? admins,
    List<ChatUser>? users,
    String? description,
  }) {
    return GroupChat(
      owner: owner ?? this.owner,
      admins: admins ?? this.admins,
      users: users ?? this.users,
      description: description ?? this.description,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GroupChat &&
        other.owner == owner &&
        listEquals(other.admins, admins) &&
        listEquals(other.users, users) &&
        other.description == description;
  }

  @override
  int get hashCode {
    return owner.hashCode ^
        admins.hashCode ^
        users.hashCode ^
        description.hashCode;
  }
}
