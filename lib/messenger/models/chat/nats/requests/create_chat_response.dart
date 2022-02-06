import 'package:json_annotation/json_annotation.dart';

part 'create_chat_response.g.dart';

@JsonSerializable()
class CreateChatResponse {
  final String chatId;
  final String chatChannel;
  CreateChatResponse(this.chatChannel, this.chatId);
  factory CreateChatResponse.fromJson(Map<String, dynamic> json) => _$CreateChatResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CreateChatResponseToJson(this);

}