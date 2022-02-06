import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_payload.g.dart';

@JsonSerializable()
class ChatPayload {
  final String id;
  final String name;
  final String description;
  final String avatar;
  final String channel;
  final int ownerId;
  final int? participantId;

  ChatPayload(
      {required this.id,
      required this.channel,
      required this.name,
      required this.description,
      required this.avatar,
      required this.ownerId,
      this.participantId});

  factory ChatPayload.fromJson(Map<String, dynamic> json) =>
      _$ChatPayloadFromJson(json);

  factory ChatPayload.fromChatTable(ChatTable chatTable) => ChatPayload(
      id: chatTable.id,
      name: chatTable.name,
      description: chatTable.description,
      avatar: chatTable.avatar,
      participantId: chatTable.participantId,
      channel: chatTable.channel,
      ownerId: chatTable.ownerId);

  Map<String, dynamic> toJson() => _$ChatPayloadToJson(this);

  ChatTable toChatTable() => ChatTable(
      id: id,
      name: name,
      description: description,
      avatar: avatar,
      ownerId: ownerId,
      channel: channel,
      updatedAt: DateTime.now());
}
