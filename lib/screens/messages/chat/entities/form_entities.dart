import 'dart:io';

import 'package:ink_mobile/extensions/nats_extension.dart';

class ChatEntities {
  String text;
  String? repliedMessageId;
  List<File>? files;
  List<File>? picsVids;
  MessageType type;
  int seq;

  ChatEntities(
      {this.text = "",
      this.repliedMessageId,
      this.files,
      this.picsVids,
      this.type = MessageType.Text,
      this.seq = 0});

  void clear() {
    text = "";
    files = null;
    picsVids = null;
    seq++;
  }
}
