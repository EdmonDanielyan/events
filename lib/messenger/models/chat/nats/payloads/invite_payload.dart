import 'package:ink_mobile/messenger/models/chat/nats/payloads/user_payload.dart';
import 'package:json_annotation/json_annotation.dart';

import 'chat_payload.dart';

part 'invite_payload.g.dart';

@JsonSerializable()
class InvitePayload {
  final UserPayload whoInvites;
  final String invitedUserId;
  final ChatPayload chat;

  InvitePayload({required this.whoInvites, required this.invitedUserId, required this.chat});

  factory InvitePayload.fromJson(Map<String, dynamic> json) =>
      _$InvitePayloadFromJson(json);

  Map<String, dynamic> toJson() => _$InvitePayloadToJson(this);
}
