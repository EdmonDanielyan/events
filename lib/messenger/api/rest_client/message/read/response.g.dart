// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadMessagesResponse _$ReadMessagesResponseFromJson(
        Map<String, dynamic> json) =>
    ReadMessagesResponse(
      success: json['success'] as bool? ?? false,
      status: json['status'] as int? ?? 0,
      token: json['token'] as String? ?? '',
    );

Map<String, dynamic> _$ReadMessagesResponseToJson(
        ReadMessagesResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'token': instance.token,
    };
