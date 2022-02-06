import 'package:json_annotation/json_annotation.dart';

import 'chat_payload.dart';

part 'chat_info.g.dart';

@JsonSerializable()
class ChatInfoUpdatePayload {
  final ChatPayload chat;
  final String userId;

  ChatInfoUpdatePayload({
    required this.chat,
    required this.userId,
  });

  factory ChatInfoUpdatePayload.fromJson(Map<String, dynamic> json) => _$ChatInfoUpdatePayloadFromJson(json);
  Map<String, dynamic> toJson() => _$ChatInfoUpdatePayloadToJson(this);

}
