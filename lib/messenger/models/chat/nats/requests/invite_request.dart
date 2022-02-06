import 'package:ink_mobile/messenger/models/chat/nats/payloads/invite_payload.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invite_request.g.dart';

@JsonSerializable()
class InviteRequest {
  final List<InvitePayload> invites;
  final String token;
  InviteRequest({required this.invites, required this.token});
  factory InviteRequest.fromJson(Map<String, dynamic> json) => _$InviteRequestFromJson(json);
  Map<String, dynamic> toJson() => _$InviteRequestToJson(this);

}