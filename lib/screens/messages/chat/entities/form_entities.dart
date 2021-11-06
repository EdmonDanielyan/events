import 'dart:io';

class ChatEntities {
  String text;
  String? repliedMessageId;
  List<File>? files;
  List<File>? picsVids;

  ChatEntities(
      {this.text = "", this.repliedMessageId, this.files, this.picsVids});

  void clear() {
    text = "";
    files = null;
    picsVids = null;
  }
}
