// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JwtPayload _$JwtPayloadFromJson(Map<String, dynamic> json) => JwtPayload(
      json['last_name'] as String? ?? '',
      json['second_name'] as String? ?? '',
      natsToken: json['nats_token'] as String? ?? '',
      expirationTime: json['exp'] as int? ?? 0,
      userId: json['userId'] as int? ?? 0,
      avatar: json['avatar'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$JwtPayloadToJson(JwtPayload instance) =>
    <String, dynamic>{
      'nats_token': instance.natsToken,
      'exp': instance.expirationTime,
      'userId': instance.userId,
      'avatar': instance.avatar,
      'name': instance.name,
      'last_name': instance.lastName,
      'second_name': instance.secondName,
    };
