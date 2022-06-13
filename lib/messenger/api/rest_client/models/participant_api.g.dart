// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParticipantApi _$ParticipantApiFromJson(Map<String, dynamic> json) =>
    ParticipantApi(
      userId: json['userId'] as int? ?? 0,
      chatId: json['chatId'] as int? ?? 0,
    );

Map<String, dynamic> _$ParticipantApiToJson(ParticipantApi instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'chatId': instance.chatId,
    };
