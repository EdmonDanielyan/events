// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InviteRequest _$InviteRequestFromJson(Map<String, dynamic> json) =>
    InviteRequest(
      invites: (json['invites'] as List<dynamic>)
          .map((e) => InvitePayload.fromJson(e as Map<String, dynamic>))
          .toList(),
      token: json['token'] as String,
    );

Map<String, dynamic> _$InviteRequestToJson(InviteRequest instance) =>
    <String, dynamic>{
      'invites': instance.invites.map((e) => e.toJson()).toList(),
      'token': instance.token,
    };
