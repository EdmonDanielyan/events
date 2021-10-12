import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/models/chat/message.dart';

import 'chat_list_state.dart';

class ChatListCubit extends Cubit<ChatListCubitState> {
  int selectedChat = 0;
  ChatListCubit() : super(ChatListCubitState());

  List<Chat> get chats => state.chats;
  bool get selectedChatExists => chats.length > selectedChat;

  void setSearchValue(String value) {
    List<Chat> items = chats.where((element) {
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

  void deleteCurrentChat() {
    if (selectedChatExists) {
      chats.removeAt(selectedChat);
      emitChats(items: chats);
    }
  }

  void reAddChat(Chat chat) {
    if (selectedChatExists) {
      chats.removeAt(selectedChat);
      chats.insert(0, chat);
      emitChats(items: chats);
    }
  }

  void updateMessages(List<Message> messages) {
    if (selectedChatExists) {
      List<Chat> newChats = chats;

      if (messages.isEmpty)
        newChats[selectedChat].messages.clear();
      else
        newChats[selectedChat].copyWith(messages: messages);

      emitChats(items: newChats);
    }
  }

  void emitChats({required List<Chat> items}) {
    emit(state.copyWith(chats: items, searchList: items));
  }

  void emitSearchList(List<Chat> items, String value) {
    emit(state.copyWith(searchList: items, searchValue: value));
  }
}
