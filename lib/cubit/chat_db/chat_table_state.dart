import 'package:ink_mobile/models/chat/database/chat_db.dart';

class ChatDatabaseCubitState {
  final ChatDatabase db;
  final String searchValue;

  const ChatDatabaseCubitState({
    required this.db,
    this.searchValue = "",
  });

  ChatDatabaseCubitState copyWith({
    ChatDatabase? db,
    String? searchValue,
  }) {
    return ChatDatabaseCubitState(
      db: db ?? this.db,
      searchValue: searchValue ?? this.searchValue,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatDatabaseCubitState &&
        other.db == db &&
        other.searchValue == searchValue;
  }

  @override
  int get hashCode => db.hashCode ^ searchValue.hashCode;
}
