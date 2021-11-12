import 'package:dio/dio.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:main_api_client/model/get_contacts.dart';

extension GetContactsExt on Response<GetContacts> {
  List<UserTable> mapResponse({List<int>? hideIds}) {
    List<UserTable> users = [];

    List items = this.data?.data.asMap['contacts'] ?? [];

    for (final item in items) {
      UserTable user = UserTable(
        id: item['id'],
        name: "${item['name']} ${item['last_name']}".trim(),
        avatar: item["photo"] ?? "",
        online: false,
      );

      if (hideIds != null && hideIds.contains(user.id)) continue;

      users.add(user);
    }

    return users;
  }
}
