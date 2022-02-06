// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatPayload _$ChatPayloadFromJson(Map<String, dynamic> json) => ChatPayload(
      id: json['id'] as String,
      channel: json['channel'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      avatar: json['avatar'] as String,
      ownerId: json['owner_id'] as int,
      participantId: json['participant_id'] as int?,
    );

Map<String, dynamic> _$ChatPayloadToJson(ChatPayload instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'description': instance.description,
    'avatar': instance.avatar,
    'channel': instance.channel,
    'owner_id': instance.ownerId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('participant_id', instance.participantId);
  return val;
}
