import 'package:json_annotation/json_annotation.dart';
import 'package:ink_mobile/messenger/api/rest_client/models/message_api.dart';

part 'response.g.dart';

@JsonSerializable()
class GetMessagesResponse {
  final bool success;
  final int status;
  final String token;
  final List<MessageApi>? data;

  const GetMessagesResponse({
    this.success = false,
    this.status = 0,
    this.token = '',
    this.data,
  });

  factory GetMessagesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMessagesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetMessagesResponseToJson(this);
}
