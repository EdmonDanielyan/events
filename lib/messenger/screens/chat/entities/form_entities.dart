import 'dart:io';

import 'package:ink_mobile/messenger/models/chat/database/schema/db_enum.dart';

class ChatEntities {
  String text;
  String? repliedMessageId;
  List<File>? files;
  List<File>? picsVids;
  StoredMessageType type;
  int seq;

  ChatEntities(
      {this.text = "",
      this.repliedMessageId,
      this.files,
      this.picsVids,
      this.type = StoredMessageType.TEXT,
      this.seq = 0});

  void clear() {
    text = "";
    files = null;
    picsVids = null;
    seq++;
  }
}
