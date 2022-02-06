import 'package:json_annotation/json_annotation.dart';

part 'auth_payload.g.dart';

@JsonSerializable()
class AuthResponsePayload {
  final String inviteChannel;
  @JsonKey(name: "chatlist_channel")
  final String chatListChannel;
  AuthResponsePayload(this.inviteChannel, this.chatListChannel);
  factory AuthResponsePayload.fromJson(Map<String, dynamic> json) => _$AuthResponsePayloadFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponsePayloadToJson(this);
}
