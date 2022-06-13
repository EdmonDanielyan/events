import 'package:ink_mobile/messenger/model/user.dart';

enum ChatPersonListEnums { LOADING, LOADED, ERROR }

class ChatPersonListCubitState {
  List<User> searchUsers;
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
    List<User>? searchUsers,
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
