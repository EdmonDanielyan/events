// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateChatResponse _$CreateChatResponseFromJson(Map<String, dynamic> json) =>
    CreateChatResponse(
      json['chat_channel'] as String,
      json['chat_id'] as String,
    );

Map<String, dynamic> _$CreateChatResponseToJson(CreateChatResponse instance) =>
    <String, dynamic>{
      'chat_id': instance.chatId,
      'chat_channel': instance.chatChannel,
    };
