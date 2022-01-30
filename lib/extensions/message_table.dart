import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/token.dart';

extension MessageTableExt on MessageTable {
  bool isByMe({int? myId}) {
    myId = myId ?? JwtPayload.myId;
    return this.userId == myId;
  }
}
