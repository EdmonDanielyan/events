import 'package:json_annotation/json_annotation.dart';
import 'package:ink_mobile/messenger/api/rest_client/models/chat_api.dart';
part 'response.g.dart';

@JsonSerializable()
class RemoveParticipantResponse {
  final bool success;
  final int status;
  final String token;
  final ChatApi? data;

  const RemoveParticipantResponse({
    this.success = false,
    this.status = 0,
    this.token = '',
    this.data,
  });

  factory RemoveParticipantResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoveParticipantResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RemoveParticipantResponseToJson(this);
}
