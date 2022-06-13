import 'dart:convert';

import 'package:equatable/equatable.dart';

class SendMessageRequest extends Equatable {
  final String message;
  final int chatId;
  final int type;
  final int? responseTo;

  const SendMessageRequest({
    this.message = '',
    this.chatId = 0,
    this.type = 0,
    this.responseTo,
  });

  SendMessageRequest copyWith({
    String? message,
    int? chatId,
    int? type,
    int? responseTo,
  }) {
    return SendMessageRequest(
      message: message ?? this.message,
      chatId: chatId ?? this.chatId,
      type: type ?? this.type,
      responseTo: responseTo ?? this.responseTo,
    );
  }

  @override
  String toString() {
    return 'SendMessageRequest(message: $message, chatId: $chatId, type: $type, responseTo: $responseTo)';
  }

  @override
  List<Object?> get props => [message, chatId, type, responseTo];

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'chat_id': chatId,
      'type': type,
      'response_to': responseTo,
    };
  }

  factory SendMessageRequest.fromMap(Map<String, dynamic> map) {
    return SendMessageRequest(
      message: map['message'] ?? '',
      chatId: map['chat_id']?.toInt() ?? 0,
      type: map['type']?.toInt() ?? 0,
      responseTo: map['response_to']?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory SendMessageRequest.fromJson(String source) =>
      SendMessageRequest.fromMap(json.decode(source));
}
