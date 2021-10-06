import 'package:ink_mobile/models/chat/chat_user.dart';

class GroupChat {
  final ChatUser creator;
  final List<ChatUser> admins;
  final List<ChatUser> users;

  GroupChat({required this.creator, required this.admins, required this.users});
}
