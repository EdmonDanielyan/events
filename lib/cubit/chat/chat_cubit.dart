import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/models/chat/chat_app_bar_enums.dart';
import 'package:ink_mobile/models/chat/message.dart';
import 'package:ink_mobile/models/items_search.dart';

import 'chat_state.dart';

@injectable
class ChatCubit extends Cubit<ChatCubitState> {
  int? previousSelectedMessageId;
  ChatCubit() : super(ChatCubitState(messagesSearch: ItemsSearch<Message>()));

  List<Message> get getMessages => []; // state.chat.messages;
  List<Message> get getSelectedMessages =>
      MessageListView.getSelectedItems(getMessages);

  void emitChat(int id) {
    emit(state.copyWith(chatId: id));
  }

  void addMessage(Message message) {
    List<Message> messages = getMessages.length > 0 ? getMessages : [];
    _emitMessages(messages..add(message));
  }

  void clearMessages() {
    _emitMessages([]);
  }

  void deleteMessage(List<Message> messages) {
    // _emitMessages(
    //   state.chat.messages
    //     ..removeWhere(
    //       (element) {
    //         bool delete = false;
    //         for (final message in messages) {
    //           if (message == element) {
    //             delete = true;
    //             break;
    //           }
    //         }
    //         return delete;
    //       },
    //     ),
    // );
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
    // List<Message> messages =
    //     MessageListView.searchMessagesByStr(value, state.chat.messages);
    // ItemsSearch<Message> item =
    //     state.messagesSearch.copyWith(items: messages, searchValue: value);
    // emitMessageSearch(item);
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
    // emit(
    //   state.copyWith(
    //     chat: state.chat.copyWith(messages: messages),
    //   ),
    // );
  }
}
