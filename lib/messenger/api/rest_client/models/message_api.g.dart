// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageApi _$MessageApiFromJson(Map<String, dynamic> json) => MessageApi(
      id: json['id'] as int? ?? 0,
      type: json['type'] as int? ?? 0,
      userId: json['userId'] as int? ?? 0,
      chatId: json['chatId'] as int? ?? 0,
      message: json['message'] as String? ?? '',
      read: json['read'] as bool? ?? false,
      edited: json['edited'] as bool? ?? false,
      responseTo: json['responseTo'] == null
          ? null
          : MessageApi.fromJson(json['responseTo'] as Map<String, dynamic>),
      updatedAt: json['updatedAt'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
    );

Map<String, dynamic> _$MessageApiToJson(MessageApi instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'userId': instance.userId,
    'chatId': instance.chatId,
    'message': instance.message,
    'read': instance.read,
    'edited': instance.edited,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('responseTo', instance.responseTo?.toJson());
  val['updatedAt'] = instance.updatedAt;
  val['createdAt'] = instance.createdAt;
  return val;
}
