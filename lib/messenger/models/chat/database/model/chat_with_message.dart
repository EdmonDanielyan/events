import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';

class ChatWithMessage {
  final ChatTable? chat;
  final MessageTable? message;

  const ChatWithMessage({
    required this.chat,
    required this.message,
  });

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
