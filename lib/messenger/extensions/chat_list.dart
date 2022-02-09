import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import './chat_table.dart';

extension ListUserTableExtension on List<ChatTable> {
  bool compareLight(List<ChatTable> list) {
    if (this.isEmpty || this.length != list.length) return false;

    final firstEqual = this.first.id == list.first.id;
    final lastEqual = this.last.id == list.last.id;

    if (firstEqual && lastEqual) {
      return true;
    }

    return false;
  }

  List<ChatTable> getIdenticalChats() {
    List<ChatTable> newChats = [];

    if (this.isNotEmpty) {
      for (final chat in this) {
        final getIdenticalChat = chat.isSingleChatExistsInList(newChats);
        if (getIdenticalChat != null) {
          newChats.add(chat);
        }
      }
    }

    return newChats.toSet().toList();
  }
}
