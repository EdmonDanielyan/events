import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/token.dart';

extension ChatTableExt on ChatTable {
  bool isGroup() => this.participantId == null;

  bool isOwner({int? myId}) {
    myId = myId ?? JwtPayload.myId;
    return this.ownerId == myId;
  }
}
