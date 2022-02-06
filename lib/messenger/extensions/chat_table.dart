import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/jwt_payload.dart';

extension ChatTableExt on ChatTable {
  bool isGroup() => this.participantId == null;

  bool isOwner({int? myId}) {
    myId = myId ?? JwtPayload.myId;
    return this.ownerId == myId;
  }
}
