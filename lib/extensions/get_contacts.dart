// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:main_api_client/model/get_contacts.dart';

extension GetContactsExt on Response<GetContacts> {
  List<UserTable> mapResponse({List<int>? hideIds}) {
    List<UserTable> users = [];

    if (this.data == null) {
      return users;
    }

    List items = this.data?.data.asMap['contacts'] ?? [];

    for (final item in items) {
      String lastName = item['last_name'];
      String name = item['name'];

      UserTable user = UserTable(
        id: item['id'],
        name: "$lastName $name".trim(),
        avatar: item["photo"] ?? "",
      );

      if (hideIds != null && hideIds.contains(user.id)) continue;

      users.add(user);
    }

    return users;
  }
}
