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
