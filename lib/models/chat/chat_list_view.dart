import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/token.dart';

import 'chat_user.dart';

class ChatListView {
  static bool isGroup(ChatTable chat) => chat.participantId == null;
  static bool isOwner(ChatTable chat, {int? myId}) {
    myId = myId ?? JwtPayload.myId;
    return chat.ownerId == myId;
  }

  static String getChatIdBetweenUsers(List<UserTable> users) {
    List<String> ids = [];
    users.sort((a, b) {
      return a.id.compareTo(b.id);
    });

    for (final user in users) {
      ids.add(user.id.toString());
    }

    return ids.join("_");
  }

  static ChatTable changeChatForParticipant(
      ChatTable chat, List<UserTable> users) {
    if (!ChatListView.isGroup(chat)) {
      UserTable oppositeUser = ChatUserViewModel.getOppositeUser(users);
      chat = chat.copyWith(
        name: oppositeUser.name,
        avatar: oppositeUser.avatar,
      );
    }
    return chat;
  }

  static bool strContainsValue(String str, String value) =>
      str.toLowerCase().contains(value.toLowerCase());
}
