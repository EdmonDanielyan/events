// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMessageResponse _$SendMessageResponseFromJson(Map<String, dynamic> json) =>
    SendMessageResponse(
      success: json['success'] as bool? ?? false,
      status: json['status'] as int? ?? 0,
      token: json['token'] as String? ?? '',
      data: json['data'] == null
          ? null
          : MessageApi.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SendMessageResponseToJson(SendMessageResponse instance) {
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
