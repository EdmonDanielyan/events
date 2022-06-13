import 'dart:convert';

import '../../../model/chat.dart';
import '../../../model/user.dart';

class CachedChatsState {
  final List<Chat> chats;
  final List<Chat> selectedChats;
  final User me;
  const CachedChatsState({
    this.chats = const [],
    this.selectedChats = const [],
    required this.me,
  });

  CachedChatsState copyWith({
    List<Chat>? chats,
    List<Chat>? selectedChats,
    User? me,
  }) {
    return CachedChatsState(
      chats: chats ?? this.chats,
      selectedChats: selectedChats ?? this.selectedChats,
      me: me ?? this.me,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chats': chats.map((x) => x.toMap()).toList(),
      'selectedChats': selectedChats.map((x) => x.toMap()).toList(),
      'me': me.toMap(),
    };
  }

  factory CachedChatsState.fromMap(Map<String, dynamic> map) {
    return CachedChatsState(
      chats: List<Chat>.from(map['chats']?.map((x) => Chat.fromMap(x))),
      selectedChats:
          List<Chat>.from(map['selectedChats']?.map((x) => Chat.fromMap(x))),
      me: User.fromMap(map['me']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CachedChatsState.fromJson(String source) =>
      CachedChatsState.fromMap(json.decode(source));

  @override
  String toString() =>
      'CachedChatsState(chats: $chats, selectedChats: $selectedChats, me: $me)';
}
