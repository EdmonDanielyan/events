import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/models/chat/chat_app_bar_enums.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message.dart';
import 'package:ink_mobile/models/items_search.dart';

import 'chat_state.dart';

@singleton
class ChatCubit extends Cubit<ChatCubitState> {
  //int? previousSelectedMessageId;
  List<MessageTable> _currentMessages = [];
  ChatCubit()
      : super(ChatCubitState(messagesSearch: ItemsSearch<MessageTable>()));

  Future<void> updateMessages(ChatDatabaseCubit chatDatabaseCubit) async {
    final messages = await chatDatabaseCubit.getSelectedChatMessages();
    _currentMessages = messages;
  }

  List<MessageTable> get getMessages => _currentMessages;

  List<MessageTable> get getSelectedMessages =>
      MessageListView.getSelectedItems(getMessages);

  void emitSelectedMessageId(int? selectedMessageId) {
    //previousSelectedMessageId = state.selectedMessageId;
    emit(state.copyWith(selectedMessageId: selectedMessageId));
  }

  void selectMessage(int index, bool select) {
    // List<Message> newMessages = getMessages;
    // newMessages[index].selected = select;
    // _emitMessages(newMessages);
  }

  void unselectAllMessages() {
    // List<Message> newMessages = getMessages;
    // for (final message in newMessages) {
    //   if (message.selected) message.selected = false;
    // }
    // _emitMessages(newMessages);
  }

  void emitAppBarEnum(ChatAppBarEnums appBarEnum) {
    emit(state.copyWith(appBarEnum: appBarEnum));
  }

  void emitSearchValue(String value) {
    List<MessageTable> searchedMessages =
        MessageListView.searchMessagesByStr(value, getMessages);

    ItemsSearch<MessageTable> item = state.messagesSearch
        .copyWith(items: searchedMessages, searchValue: value);

    emitMessageSearch(item);
  }

  void upSearch() {
    ItemsSearch<MessageTable> item =
        state.messagesSearch.decreaseIndexAndReturn();

    // ItemsSearch<MessageTable> item =
    //     state.messagesSearch.decreaseIndexAndReturn();
    emitMessageSearch(item);
  }

  void downSearch() {
    ItemsSearch<MessageTable> item =
        state.messagesSearch.increaseIndexAndReturn();
    emitMessageSearch(item);
  }

  void emptySearch() {
    ItemsSearch<MessageTable> item = state.messagesSearch
        .copyWith(items: List<MessageTable>.empty(), searchValue: "");
    emitMessageSearch(item);
  }

  void emitMessageSearch(ItemsSearch<MessageTable> messagesSearch) async {
    final currentState = state.copyWith(messagesSearch: messagesSearch);
    print("EMITTING");
    print(currentState.messagesSearch);
    emit(currentState);
  }
}
