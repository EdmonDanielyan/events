import 'package:json_annotation/json_annotation.dart';

part 'create_chat_request.g.dart';

@JsonSerializable()
class CreateChatRequest {
  final String ownerId;
  final String? participantId;
  final String token;

  const CreateChatRequest(
      {required this.ownerId, required this.token, this.participantId});

  factory CreateChatRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateChatRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateChatRequestToJson(this);
}
