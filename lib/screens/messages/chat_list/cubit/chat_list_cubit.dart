import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/screens/messages/chat_list/cubit/chat_list_state.dart';

class ChatListCubit extends Cubit<ChatListCubitState> {
  ChatListCubit() : super(ChatListCubitState());

  void setSearchValue(String value) {
    List<Chat> items = state.chats.where((element) {
      bool containsChatName =
          element.chatName.toLowerCase().contains(value.toLowerCase());
      bool containsUserName =
          element.message.user.name.toLowerCase().contains(value.toLowerCase());
      bool containsMessage =
          element.message.message.toLowerCase().contains(value.toLowerCase());

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
