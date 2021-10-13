import 'package:ink_mobile/models/chat/chat.dart';

class ChatCubitState {
  Chat chat;
  int? selectedMessageId;

  ChatCubitState({
    required this.chat,
    this.selectedMessageId,
  });

  ChatCubitState copyWith({
    Chat? chat,
    int? selectedMessageId,
  }) {
    return ChatCubitState(
      chat: chat ?? this.chat,
      selectedMessageId: selectedMessageId,
    );
  }
}
