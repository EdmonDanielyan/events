import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/models/chat/chat_app_bar_enums.dart';
import 'package:ink_mobile/models/chat/message.dart';
import 'package:ink_mobile/models/items_search.dart';

import 'chat_state.dart';

class ChatCubit extends Cubit<ChatCubitState> {
  int? previousSelectedMessageId;
  ChatCubit()
      : super(ChatCubitState(
            chat: Chat(avatarUrl: "", messages: []),
            messagesSearch: ItemsSearch<Message>()));

  List<Message> get getMessages => state.chat.messages;
  List<Message> get getSelectedMessages =>
      MessageListView.getSelectedItems(getMessages);

  void emitChat(Chat chat) {
    emit(state.copyWith(chat: chat));
  }

  void addMessage(Message message) {
    _emitMessages(state.chat.messages..add(message));
  }

  void clearMessages() {
    _emitMessages([]);
  }

  void deleteMessage(Message message) {
    _emitMessages(
      state.chat.messages..removeWhere((element) => element == message),
    );
  }

  void emitSelectedMessageId(int? selectedMessageId) {
    previousSelectedMessageId = state.selectedMessageId;
    emit(state.copyWith(selectedMessageId: selectedMessageId));
  }

  void selectMessage(int index, bool select) {
    List<Message> newMessages = getMessages;
    newMessages[index].selected = select;
    _emitMessages(newMessages);
  }

  void unselectAllMessages() {
    List<Message> newMessages = getMessages;
    for (final message in newMessages) {
      if (message.selected) message.selected = false;
    }
    _emitMessages(newMessages);
  }

  void emitAppBarEnum(ChatAppBarEnums appBarEnum) {
    emit(state.copyWith(appBarEnum: appBarEnum));
  }

  void emitSearchValue(String value) {
    List<Message> messages =
        MessageListView.searchMessagesByStr(value, state.chat.messages);
    ItemsSearch<Message> item =
        state.messagesSearch.copyWith(items: messages, searchValue: value);
    emitMessageSearch(item);
  }

  void emptySearch() {
    ItemsSearch<Message> item = state.messagesSearch
        .copyWith(items: List<Message>.empty(), searchValue: "");
    emitMessageSearch(item);
  }

  void emitMessageSearch(ItemsSearch<Message> messagesSearch) {
    emit(state.copyWith(messagesSearch: messagesSearch));
  }

  void _emitMessages(List<Message> messages) {
    emit(
      state.copyWith(
        chat: state.chat.copyWith(messages: messages),
      ),
    );
  }
}
