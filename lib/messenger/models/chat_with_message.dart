import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';

class ChatWithMessage {
  final ChatTable chat;
  final MessageTable? message;
  ChatWithMessage({
    required this.chat,
    this.message,
  });

  ChatWithMessage copyWith({
    ChatTable? chat,
    MessageTable? message,
  }) {
    return ChatWithMessage(
      chat: chat ?? this.chat,
      message: message ?? this.message,
    );
  }

  @override
  String toString() => 'ChatWithMessage(chat: $chat, message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatWithMessage &&
        other.chat == chat &&
        other.message == message;
  }

  @override
  int get hashCode => chat.hashCode ^ message.hashCode;
}
