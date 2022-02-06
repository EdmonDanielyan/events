// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatInfoUpdatePayload _$ChatInfoUpdatePayloadFromJson(
        Map<String, dynamic> json) =>
    ChatInfoUpdatePayload(
      chat: ChatPayload.fromJson(json['chat'] as Map<String, dynamic>),
      userId: json['user_id'] as String,
    );

Map<String, dynamic> _$ChatInfoUpdatePayloadToJson(
        ChatInfoUpdatePayload instance) =>
    <String, dynamic>{
      'chat': instance.chat.toJson(),
      'user_id': instance.userId,
    };
