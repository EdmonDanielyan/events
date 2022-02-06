import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_payload.g.dart';

@JsonSerializable()
class UserPayload {
  final int id;
  final String name;
  final String avatar;

  UserPayload({required this.id, required this.name, required this.avatar});

  factory UserPayload.fromJson(Map<String, dynamic> json) =>
      _$UserPayloadFromJson(json);

  factory UserPayload.fromUserTable(UserTable userTable) => UserPayload(
      id: userTable.id, name: userTable.name, avatar: userTable.avatar);

  Map<String, dynamic> toJson() => _$UserPayloadToJson(this);

  UserTable toUserTable() => UserTable(id: id, name: name, avatar: avatar);
}
