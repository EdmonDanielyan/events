import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/models/chat/selected_message.dart';

class ChatCubitState {
  Chat chat;
  SelectedMessage? selectedMessage;

  ChatCubitState({
    required this.chat,
    this.selectedMessage,
  });

  ChatCubitState copyWith({
    Chat? chat,
    SelectedMessage? selectedMessage,
  }) {
    return ChatCubitState(
      chat: chat ?? this.chat,
      selectedMessage: selectedMessage,
    );
  }
}
