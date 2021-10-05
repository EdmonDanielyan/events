import 'package:ink_mobile/models/chat.dart';

class ChatListCubitState {
  List<Chat> chats;
  List<Chat> searchList;
  String searchValue;

  ChatListCubitState({
    this.chats = const [],
    this.searchValue = "",
    this.searchList = const [],
  });

  ChatListCubitState copyWith({
    List<Chat>? chats,
    List<Chat>? searchList,
    String? searchValue,
  }) {
    return ChatListCubitState(
      chats: chats ?? this.chats,
      searchList: searchList ?? this.searchList,
      searchValue: searchValue ?? this.searchValue,
    );
  }
}
