import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/messenger/models/chat_app_bar_modes.dart';
import 'package:ink_mobile/messenger/models/message_list_view.dart';
import 'package:ink_mobile/messenger/models/texting.dart';
import 'package:ink_mobile/models/items_search.dart';

import 'chat_state.dart';

@singleton
class ChatCubit extends Cubit<ChatCubitState> {
  List<MessageWithUser> _currentMessages = [];

  ChatCubit()
      : super(ChatCubitState(messagesSearch: ItemsSearch<MessageTable>()));

  Future<void> updateMessages(ChatDatabaseCubit chatDatabaseCubit) async {
    final messages = await chatDatabaseCubit.getSelectedChatMessagesWithUser();
    _currentMessages = messages;
  }

  List<MessageTable> get getMessages =>
      MessageListView.messageWithUsersToMessage(_currentMessages);
  List<MessageWithUser> get getMessagesWithUser => _currentMessages;
  bool get scrollBtn => state.scrollBtn;

  MessageWithUser? getMessageById(String id) {
    return getMessagesWithUser
        .firstWhere((element) => element.message!.id == id, orElse: null);
  }

  void setScrollBtn(bool set) {
    emit(state.copyWith(scrollBtn: set));
  }

  void emitTexting(CustomTexting texting) {
    emit(state.copyWith(texting: texting));
  }

  void clean() {
    emitSelectedMessageId(null);
  }

  void emitSelectedMessageId(String? messageId) {
    emit(state.copyNull(selectedMessageId: messageId));
  }

  void emitEditMessage(MessageWithUser? message) {
    emit(state.copyNull(editMessage: message));
  }

  void emitAppBarEnum(ChatAppBarMode appBarEnum) {
    emit(state.copyWith(appBarEnum: appBarEnum));
  }

  void emitSearchValue(String value) {
    value = value.trim();
    List<MessageTable> searchedMessages =
        MessageListView.searchMessagesByStr(value, getMessages);

    ItemsSearch<MessageTable> item = state.messagesSearch
        .copyWith(items: searchedMessages, searchValue: value);

    emitMessageSearch(item);
  }

  void upSearch() {
    ItemsSearch<MessageTable> item =
        state.messagesSearch.decreaseIndexAndReturn();
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
    emit(currentState);
  }
}
