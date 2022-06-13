// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteMessagesResponse _$DeleteMessagesResponseFromJson(
        Map<String, dynamic> json) =>
    DeleteMessagesResponse(
      success: json['success'] as bool? ?? false,
      status: json['status'] as int? ?? 0,
      token: json['token'] as String? ?? '',
    );

Map<String, dynamic> _$DeleteMessagesResponseToJson(
        DeleteMessagesResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'token': instance.token,
    };
