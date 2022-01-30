import 'package:collection/collection.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';

class MessageWithUser {
  final MessageTable? message;
  final UserTable? user;

  const MessageWithUser({
    required this.message,
    required this.user,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MessageWithUser &&
        other.message == message &&
        other.user == user;
  }

  @override
  int get hashCode => message.hashCode ^ user.hashCode;
}

class MessageWithUserListView {
  static List<MessageTable> getMessagesFromList(
      List<MessageWithUser> messagesWithUser) {
    List<MessageTable> messages = [];
    for (final messageWithUser in messagesWithUser) {
      messages.add(messageWithUser.message!);
    }
    return messages;
  }

  static MessageWithUser? getByMessageId(
          String id, List<MessageWithUser> messagesWithUser) =>
      messagesWithUser.firstWhereOrNull((element) => element.message!.id == id);
}
