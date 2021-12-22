import 'package:flutter/foundation.dart';

import 'package:ink_mobile/models/chat/database/chat_db.dart';

class ChatListState {
  final List<ChatTable> chats;
  final List<ChatTable> searchChats;
  final String searchValue;

  const ChatListState({
    required this.chats,
    required this.searchChats,
    this.searchValue = "",
  });

  ChatListState copyWith({
    List<ChatTable>? chats,
    List<ChatTable>? searchChats,
    String? searchValue,
  }) {
    return ChatListState(
      searchChats: searchChats ?? this.searchChats,
      chats: chats ?? this.chats,
      searchValue: searchValue ?? this.searchValue,
    );
  }

  @override
  String toString() =>
      'ChatListState(chats: $chats, searchChats: $searchChats, searchValue: $searchValue)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatListState &&
        listEquals(other.searchChats, searchChats) &&
        listEquals(other.chats, chats) &&
        other.searchValue == searchValue;
  }

  @override
  int get hashCode =>
      chats.hashCode ^ searchChats.hashCode ^ searchValue.hashCode;
}
