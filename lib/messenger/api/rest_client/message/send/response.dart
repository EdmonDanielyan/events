import 'package:json_annotation/json_annotation.dart';
import 'package:ink_mobile/messenger/api/rest_client/models/message_api.dart';

part 'response.g.dart';

@JsonSerializable()
class SendMessageResponse {
  final bool success;
  final int status;
  final String token;
  final MessageApi? data;

  const SendMessageResponse({
    this.success = false,
    this.status = 0,
    this.token = '',
    this.data,
  });

  factory SendMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$SendMessageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SendMessageResponseToJson(this);
}
