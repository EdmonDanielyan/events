import 'package:ink_mobile/models/chat/database/chat_db.dart';

class ChatDatabaseCubitState {
  final ChatDatabase db;
  final String searchValue;
  final ChatTable? selectedChat;
  final bool loadingChats;

  const ChatDatabaseCubitState({
    required this.db,
    this.searchValue = "",
    this.selectedChat,
    this.loadingChats = true,
  });

  ChatDatabaseCubitState copyWith({
    ChatDatabase? db,
    String? searchValue,
    ChatTable? selectedChat,
    bool? loadingChats,
  }) {
    return ChatDatabaseCubitState(
      db: db ?? this.db,
      searchValue: searchValue ?? this.searchValue,
      selectedChat: selectedChat,
      loadingChats: loadingChats ?? this.loadingChats,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatDatabaseCubitState &&
        other.db == db &&
        other.searchValue == searchValue &&
        other.selectedChat == selectedChat &&
        other.loadingChats == loadingChats;
  }

  @override
  int get hashCode =>
      db.hashCode ^
      searchValue.hashCode ^
      selectedChat.hashCode ^
      loadingChats.hashCode;

  @override
  String toString() =>
      'ChatDatabaseCubitState(db: $db, searchValue: $searchValue, selectedChat: $selectedChat, loadingChats: $loadingChats)';
}
