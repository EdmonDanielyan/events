import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/token.dart';

extension ChatTableExt on ChatTable {
  bool isGroup() => this.participantId == null;

  bool isOwner({int? myId}) {
    myId = myId ?? JwtPayload.myId;
    return this.ownerId == myId;
  }

  ChatTable? isSingleChatExistsInList(List<ChatTable> chats) {
    if (chats.isNotEmpty) {
      for (final chat in chats) {
        if (!chat.isGroup() &&
            this.ownerId == chat.ownerId &&
            this.participantId == chat.participantId) {
          return chat;
        }
      }
    }

    return null;
  }
}
