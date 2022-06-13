// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InviteChatResponse _$InviteChatResponseFromJson(Map<String, dynamic> json) =>
    InviteChatResponse(
      success: json['success'] as bool? ?? false,
      status: json['status'] as int? ?? 0,
      token: json['token'] as String? ?? '',
      data: json['data'] == null
          ? null
          : ChatApi.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InviteChatResponseToJson(InviteChatResponse instance) {
  final val = <String, dynamic>{
    'success': instance.success,
    'status': instance.status,
    'token': instance.token,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data?.toJson());
  return val;
}
