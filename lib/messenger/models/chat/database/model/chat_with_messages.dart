import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';

class ChatWithMessages {
  final ChatTable? chat;
  final MessageTable? messages;

  const ChatWithMessages({
    required this.chat,
    required this.messages,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatWithMessages &&
        other.chat == chat &&
        other.messages == messages;
  }

  @override
  int get hashCode => chat.hashCode ^ messages.hashCode;
}
