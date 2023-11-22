import 'package:dio/dio.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/models/absence.dart';
import 'package:openapi/openapi.dart';

extension GetContactsExt on Response<GetContacts> {
  List<User> mapResponse({List<int>? hideIds}) {
    List<User> users = [];

    if (data == null) {
      return users;
    }

    List items = data?.data.asMap['contacts'] ?? [];

    for (final item in items) {
      String lastName = item['last_name'] ?? "";
      String name = item['name'] ?? "";

      User user = User(
        id: item['id'],
        name: "$lastName $name".trim(),
        avatarUrl: item["photo"] ?? "",
        absence:
            item["absence"] != null ? Absence.fromMap(item["absence"]) : null,
        workPosition: item["work_position"],
        birthday: item["birthday"] != null
            ? DateTime.tryParse(item["birthday"])
            : null,
      );

      if (hideIds != null && hideIds.contains(user.id)) continue;

      users.add(user);
    }

    return users;
  }
}
