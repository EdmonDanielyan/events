import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/models/chat/chat.dart';

import 'chat_list_state.dart';

class ChatListCubit extends Cubit<ChatListCubitState> {
  int selectedChat = 0;
  ChatListCubit() : super(ChatListCubitState());

  void setSearchValue(String value) {
    List<Chat> items = state.chats.where((element) {
      bool containsChatName =
          element.chatName.toLowerCase().contains(value.toLowerCase());
      bool containsUserName = element.messages.last.user.name
          .toLowerCase()
          .contains(value.toLowerCase());
      bool containsMessage = element.messages.last.message
          .toLowerCase()
          .contains(value.toLowerCase());

      return containsChatName || containsUserName || containsMessage;
    }).toList();
    emitSearchList(items, value);
  }

  void addChat(Chat chat) {
    List<Chat> chats = state.chats;
    chats[selectedChat] = chat;
    emitChats(items: chats);
  }

  void emitChats({required List<Chat> items}) {
    emit(state.copyWith(chats: items, searchList: items));
  }

  void emitSearchList(List<Chat> items, String value) {
    emit(state.copyWith(searchList: items, searchValue: value));
  }
}
