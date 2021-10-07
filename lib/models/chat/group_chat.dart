import 'package:ink_mobile/models/chat/chat_user.dart';

class GroupChat {
  final ChatUser owner;
  final List<ChatUser> admins;
  final List<ChatUser> users;
  final String description;

  GroupChat({
    required this.owner,
    this.admins = const [],
    required this.users,
    this.description = "",
  });
}
