import 'package:json_annotation/json_annotation.dart';
import 'package:ink_mobile/messenger/api/rest_client/models/chat_api.dart';

part 'response.g.dart';

@JsonSerializable()
class CreateChatResponse {
  final bool success;
  final int status;
  final String token;
  final ChatApi? data;

  const CreateChatResponse({
    this.success = false,
    this.status = 0,
    this.token = '',
    this.data,
  });

  factory CreateChatResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateChatResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CreateChatResponseToJson(this);
}
