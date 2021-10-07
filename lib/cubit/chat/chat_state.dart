import 'package:ink_mobile/models/chat/chat.dart';

class ChatCubitState {
  Chat chat;

  ChatCubitState({
    required this.chat,
  });

  ChatCubitState copyWith({Chat? chat}) {
    return ChatCubitState(
      chat: chat ?? this.chat,
    );
  }
}
