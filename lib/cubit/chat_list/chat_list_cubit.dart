import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/models/chat/message.dart';

import 'chat_list_state.dart';

@injectable
class ChatListCubit extends Cubit<ChatListCubitState> {
  int selectedChat = 0;
  ChatListCubit() : super(ChatListCubitState());

  List<Chat> get chats => state.chats;
  bool get selectedChatExists => chats.length > selectedChat;

  void setSearchValue(String value) {
    List<Chat> items = ChatListView.searchChats(value, chats);
    emitSearchList(items, value);
  }

  void deleteCurrentChat() {
    if (selectedChatExists) {
      chats.removeAt(selectedChat);
      emitChats(items: chats);
    }
  }

  void addChat(Chat chat) {
    chats.insert(0, chat);
    emitChats(items: chats);
  }

  void updateAndSetToFirst(Chat chat) {
    if (selectedChatExists) {
      chats.removeAt(selectedChat);
      chats.insert(0, chat);
      selectedChat = 0;
      emitChats(items: chats);
    }
  }

  void updateChat(Chat chat) {
    if (selectedChatExists) {
      chats[selectedChat] = chat;
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
