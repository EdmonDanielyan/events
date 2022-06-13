import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class GetChatListResponse {
  final bool success;
  final int status;
  final String token;
  final List<int>? data;

  const GetChatListResponse({
    this.success = false,
    this.status = 0,
    this.token = '',
    this.data,
  });

  factory GetChatListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetChatListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetChatListResponseToJson(this);
}
