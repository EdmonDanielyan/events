import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/screens/messages/cubit/chat_list_state.dart';

class ChatListCubit extends Cubit<ChatListCubitState> {
  int selectedChatIndex = 0;
  ChatListCubit() : super(ChatListCubitState());

  void selectChat(int index) => selectedChatIndex = index;

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

  void emitChats(List<Chat> items) {
    emit(state.copyWith(chats: items, searchList: items));
  }

  void emitSearchList(List<Chat> items, String value) {
    emit(state.copyWith(searchList: items, searchValue: value));
  }
}
