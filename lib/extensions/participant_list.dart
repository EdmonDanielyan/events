import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';

extension ListUserTableExtension on List<ParticipantTable> {
  bool compareLight(List<ParticipantTable> list) {
    if (this.isEmpty || this.length != list.length) return false;

    final firstEqual = this.first.userId == list.first.userId;
    final lastEqual = this.last.userId == list.last.userId;

    if (firstEqual && lastEqual) {
      return true;
    }

    return false;
  }
}
