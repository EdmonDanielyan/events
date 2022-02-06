// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvitePayload _$InvitePayloadFromJson(Map<String, dynamic> json) =>
    InvitePayload(
      whoInvites:
          UserPayload.fromJson(json['who_invites'] as Map<String, dynamic>),
      invitedUserId: json['invited_user_id'] as String,
      chat: ChatPayload.fromJson(json['chat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InvitePayloadToJson(InvitePayload instance) =>
    <String, dynamic>{
      'who_invites': instance.whoInvites.toJson(),
      'invited_user_id': instance.invitedUserId,
      'chat': instance.chat.toJson(),
    };
