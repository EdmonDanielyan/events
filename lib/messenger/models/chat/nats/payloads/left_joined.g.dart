// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'left_joined.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeftJoinedPayload _$LeftJoinedPayloadFromJson(Map<String, dynamic> json) =>
    LeftJoinedPayload(
      chatId: json['chat_id'] as String,
      users: (json['users'] as List<dynamic>)
          .map((e) => UserPayload.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LeftJoinedPayloadToJson(LeftJoinedPayload instance) =>
    <String, dynamic>{
      'chat_id': instance.chatId,
      'users': instance.users.map((e) => e.toJson()).toList(),
    };
