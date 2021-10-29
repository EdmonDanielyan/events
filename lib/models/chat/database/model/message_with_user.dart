import 'package:ink_mobile/models/chat/database/chat_db.dart';

class MessageWithUser {
  final MessageTable? message;
  final UserTable? user;

  const MessageWithUser({required this.message, required this.user});
}
