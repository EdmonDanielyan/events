import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/database/model/message_with_user.dart';

class ChatMessageUser {
  final ChatTable chat;
  final MessageWithUser messageWithUser;

  const ChatMessageUser({
    required this.chat,
    required this.messageWithUser,
  });

  ChatMessageUser copyWith({
    ChatTable? chat,
    MessageWithUser? messageWithUser,
  }) {
    return ChatMessageUser(
      chat: chat ?? this.chat,
      messageWithUser: messageWithUser ?? this.messageWithUser,
    );
  }

  @override
  String toString() =>
      'ChatMessageUser(chat: $chat, messageWithUser: $messageWithUser)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatMessageUser &&
        other.chat == chat &&
        other.messageWithUser == messageWithUser;
  }

  @override
  int get hashCode => chat.hashCode ^ messageWithUser.hashCode;
}
