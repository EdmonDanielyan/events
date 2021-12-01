import 'package:ink_mobile/models/chat/database/chat_db.dart';

class ChatDatabaseCubitState {
  final ChatDatabase db;
  final String searchValue;
  final ChatTable? selectedChat;

  const ChatDatabaseCubitState({
    required this.db,
    this.searchValue = "",
    this.selectedChat,
  });

  ChatDatabaseCubitState copyWith({
    ChatDatabase? db,
    String? searchValue,
    ChatTable? selectedChat,
  }) {
    return ChatDatabaseCubitState(
      db: db ?? this.db,
      searchValue: searchValue ?? this.searchValue,
      selectedChat: selectedChat,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatDatabaseCubitState &&
        other.db == db &&
        other.searchValue == searchValue &&
        other.selectedChat == selectedChat;
  }

  @override
  int get hashCode =>
      db.hashCode ^ searchValue.hashCode ^ selectedChat.hashCode;

  @override
  String toString() =>
      'ChatDatabaseCubitState(db: $db, searchValue: $searchValue, selectedChat: $selectedChat)';
}
