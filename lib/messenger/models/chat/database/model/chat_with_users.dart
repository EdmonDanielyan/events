import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';

class ChatWithUsers {
  final ChatTable? chat;
  final List<UserTable>? users;

  const ChatWithUsers({
    required this.chat,
    required this.users,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatWithUsers && other.chat == chat && other.users == users;
  }

  @override
  int get hashCode => chat.hashCode ^ users.hashCode;
}
