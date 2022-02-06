// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponsePayload _$AuthResponsePayloadFromJson(Map<String, dynamic> json) =>
    AuthResponsePayload(
      json['invite_channel'] as String,
      json['chatlist_channel'] as String,
    );

Map<String, dynamic> _$AuthResponsePayloadToJson(
        AuthResponsePayload instance) =>
    <String, dynamic>{
      'invite_channel': instance.inviteChannel,
      'chatlist_channel': instance.chatListChannel,
    };
