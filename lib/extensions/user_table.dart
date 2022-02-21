import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';

extension UserExt on UserTable {
  String shortenName({String searchValue = ""}) {
    String name = this.name;
    final splitName = name.split(" ");
    if (searchValue.isNotEmpty && splitName.length >= 2) {
      var lastName = splitName[0];
      var otherName = name.substring(lastName.length);
      if (otherName.toLowerCase().contains(searchValue.toLowerCase()) &&
          lastName.isNotEmpty) {
        lastName = "${lastName[0]}.";
      }

      name = "${lastName.trim()} ${otherName.trim()}".trim();
    }

    return name;
  }
}
