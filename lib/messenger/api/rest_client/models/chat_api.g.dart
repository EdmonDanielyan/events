// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatApi _$ChatApiFromJson(Map<String, dynamic> json) => ChatApi(
      id: json['id'] as int? ?? 0,
      type: json['type'] as int? ?? 0,
      ownerId: json['ownerId'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      avatarUrl: json['avatarUrl'] as String? ?? '',
      participants: (json['participants'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      message: json['message'] == null
          ? null
          : MessageApi.fromJson(json['message'] as Map<String, dynamic>),
      updatedAt: json['updatedAt'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
    );

Map<String, dynamic> _$ChatApiToJson(ChatApi instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'ownerId': instance.ownerId,
    'name': instance.name,
    'description': instance.description,
    'avatarUrl': instance.avatarUrl,
    'participants': instance.participants,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message?.toJson());
  val['updatedAt'] = instance.updatedAt;
  val['createdAt'] = instance.createdAt;
  return val;
}
