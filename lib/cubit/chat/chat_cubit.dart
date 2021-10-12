import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/models/chat/message.dart';
import 'package:ink_mobile/models/chat/selected_message.dart';

import 'chat_state.dart';

class ChatCubit extends Cubit<ChatCubitState> {
  ChatCubit() : super(ChatCubitState(chat: Chat(avatarUrl: "", messages: [])));

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

  void emitSelectedMessage(SelectedMessage? selectedMessage) {
    emit(state.copyWith(selectedMessage: selectedMessage));
  }

  void _emitMessages(List<Message> messages) {
    emit(
      state.copyWith(
        chat: state.chat.copyWith(messages: messages),
      ),
    );
  }
}
