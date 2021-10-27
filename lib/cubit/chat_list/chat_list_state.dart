import 'package:ink_mobile/models/chat/chat.dart';

class ChatListCubitState {
  List<Chat> chats;
  List<Chat> searchList;
  String searchValue;

  ChatListCubitState({
    required this.chats,
    this.searchValue = "",
    required this.searchList,
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
