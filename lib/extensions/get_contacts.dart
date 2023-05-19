// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:main_api_client/model/get_contacts.dart';

extension GetContactsExt on Response<GetContacts> {
  List<User> mapResponse({List<int>? hideIds}) {
    List<User> users = [];

    if (this.data == null) {
      return users;
    }

    List items = this.data?.data.asMap['contacts'] ?? [];

    for (final item in items) {
      String lastName = item['last_name'] ?? "";
      String name = item['name'] ?? "";

      User user = User(
        id: item['id'],
        name: "$lastName $name".trim(),
        avatarUrl: item["photo"] ?? "",
        absence: item["absence"],
        workPosition: item["work_position"],
      );

      if (hideIds != null && hideIds.contains(user.id)) continue;

      users.add(user);
    }

    return users;
  }
}
