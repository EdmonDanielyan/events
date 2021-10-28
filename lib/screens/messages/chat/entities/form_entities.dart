import 'dart:io';

class ChatEntities {
  String text;
  List<File>? files;
  List<File>? picsVids;

  ChatEntities({this.text = "", this.files, this.picsVids});

  void clear() {
    text = "";
    files = null;
    picsVids = null;
  }
}
