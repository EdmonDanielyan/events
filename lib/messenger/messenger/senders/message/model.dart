import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:ink_mobile/messenger/model/message.dart';

class MessageSenderModel extends Equatable {
  final List<Message> messages;
  final String token;
  const MessageSenderModel({
    this.messages = const [],
    this.token = '',
  });

  MessageSenderModel copyWith({
    List<Message>? messages,
    String? token,
  }) {
    return MessageSenderModel(
      messages: messages ?? this.messages,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'messages': messages.map((x) => x.toMap()).toList(),
      'token': token,
    };
  }

  factory MessageSenderModel.fromMap(Map<String, dynamic> map) {
    return MessageSenderModel(
      messages:
          List<Message>.from(map['messages']?.map((x) => Message.fromMap(x))),
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageSenderModel.fromJson(String source) =>
      MessageSenderModel.fromMap(json.decode(source));

  @override
  String toString() => 'MessageSenderModel(messages: $messages, token: $token)';

  @override
  List<Object> get props => [messages, token];

  static MessageSenderModel? fromJsonCustom(String source) {
    try {
      return MessageSenderModel.fromMap(json.decode(source));
    } catch (_) {
      return null;
    }
  }
}
