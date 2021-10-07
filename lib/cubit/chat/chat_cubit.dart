import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/models/chat/message.dart';

import 'chat_state.dart';

class ChatCubit extends Cubit<ChatCubitState> {
  ChatCubit() : super(ChatCubitState(chat: Chat(avatarUrl: "", messages: [])));

  void emitChat(Chat chat) {
    emit(state.copyWith(chat: chat));
  }

  void addMessage(Message message) {
    emit(
      state.copyWith(
        chat: state.chat.copyWith(
          messages: state.chat.messages..add(message),
        ),
      ),
    );
  }
}
