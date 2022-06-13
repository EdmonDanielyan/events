// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorApiResponse _$ErrorApiResponseFromJson(Map<String, dynamic> json) =>
    ErrorApiResponse(
      status: json['status'] as int?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ErrorApiResponseToJson(ErrorApiResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull('title', instance.title);
  return val;
}

ErrorApiResponseData _$ErrorApiResponseDataFromJson(
        Map<String, dynamic> json) =>
    ErrorApiResponseData(
      message: json['message'] as String,
    );

Map<String, dynamic> _$ErrorApiResponseDataToJson(
        ErrorApiResponseData instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
