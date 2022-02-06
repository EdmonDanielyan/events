import 'package:json_annotation/json_annotation.dart';

part 'create_chat_request.g.dart';
@JsonSerializable()
class CreateChatRequest {
  final String ownerId;
  final String token;

  CreateChatRequest({required this.ownerId, required this.token});
  factory CreateChatRequest.fromJson(Map<String, dynamic> json) => _$CreateChatRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateChatRequestToJson(this);

}