// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetChatsResponse _$GetChatsResponseFromJson(Map<String, dynamic> json) =>
    GetChatsResponse(
      success: json['success'] as bool? ?? false,
      status: json['status'] as int? ?? 0,
      token: json['token'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ChatApi.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetChatsResponseToJson(GetChatsResponse instance) {
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

  writeNotNull('data', instance.data?.map((e) => e.toJson()).toList());
  return val;
}
