import 'package:dio/dio.dart';
import 'package:ink_mobile/models/chat/chat_user_select.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:main_api_client/model/get_contacts.dart';

extension GetContactsExt on Response<GetContacts> {
  List<ChatUserSelect> mapResponse({bool hideMe = false}) {
    List<ChatUserSelect> users = [];

    List items = this.data?.data.asMap['contacts'] ?? [];

    for (final item in items) {
      ChatUserSelect user = ChatUserSelect(
        id: item['id'],
        name: "${item['name']} ${item['last_name']}".trim(),
        avatar: item["avatar"] ?? "",
      );

      if (hideMe == true) {
        if (user.id == JwtPayload.myId) continue;
      }

      users.add(user);
    }

    return users;
  }
}
