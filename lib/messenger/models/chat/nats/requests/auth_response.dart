import 'package:ink_mobile/messenger/models/chat/nats/payloads/auth_payload.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  final AuthResponsePayload data;
  final String token;
  AuthResponse(this.data, this.token);

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);

}