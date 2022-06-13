import 'package:json_annotation/json_annotation.dart';
import 'package:ink_mobile/messenger/api/rest_client/models/chat_api.dart';

part 'response.g.dart';

@JsonSerializable()
class GetChatsResponse {
  final bool success;
  final int status;
  final String token;
  final List<ChatApi>? data;

  const GetChatsResponse({
    this.success = false,
    this.status = 0,
    this.token = '',
    this.data,
  });

  factory GetChatsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetChatsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetChatsResponseToJson(this);
}
