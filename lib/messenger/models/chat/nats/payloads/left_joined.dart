
import 'package:json_annotation/json_annotation.dart';

import 'user_payload.dart';

part 'left_joined.g.dart';

@JsonSerializable()
class LeftJoinedPayload {
  final String chatId;
  final List<UserPayload> users;

  LeftJoinedPayload({
    required this.chatId,
    required this.users,
  });
  factory LeftJoinedPayload.fromJson(Map<String, dynamic> json) => _$LeftJoinedPayloadFromJson(json);
  Map<String, dynamic> toJson() => _$LeftJoinedPayloadToJson(this);
}
