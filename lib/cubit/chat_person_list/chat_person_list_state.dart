import 'package:ink_mobile/models/chat/database/chat_db.dart';

enum ChatPersonListEnums { LOADING, LOADED, ERROR }

class ChatPersonListCubitState {
  List<UserTable> searchUsers;
  String searchValue;
  ChatPersonListEnums type;
  String errorMsg;

  ChatPersonListCubitState({
    this.searchUsers = const [],
    this.searchValue = "",
    this.type = ChatPersonListEnums.LOADING,
    this.errorMsg = "",
  });

  ChatPersonListCubitState copyWith({
    List<UserTable>? searchUsers,
    String? searchValue,
    ChatPersonListEnums? type,
    String? errorMsg,
  }) {
    return ChatPersonListCubitState(
      searchUsers: searchUsers ?? this.searchUsers,
      searchValue: searchValue ?? this.searchValue,
      type: type ?? this.type,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
