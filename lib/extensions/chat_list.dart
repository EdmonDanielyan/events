import 'package:ink_mobile/models/chat/database/chat_db.dart';

extension ListUserTableExtension on List<ChatTable> {
  bool compareLight(List<ChatTable> list) {
    if (this.length != list.length) return false;

    final firstEqual = this.first.id == list.first.id;
    final lastEqual = this.last.id == list.last.id;

    if (firstEqual && lastEqual) {
      return true;
    }

    return false;
  }
}
