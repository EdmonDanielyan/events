// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_chat_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateChatRequest _$CreateChatRequestFromJson(Map<String, dynamic> json) =>
    CreateChatRequest(
      ownerId: json['owner_id'] as String,
      token: json['token'] as String,
      participantId: json['participant_id'] as String?,
    );

Map<String, dynamic> _$CreateChatRequestToJson(CreateChatRequest instance) {
  final val = <String, dynamic>{
    'owner_id': instance.ownerId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('participant_id', instance.participantId);
  val['token'] = instance.token;
  return val;
}
