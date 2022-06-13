import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:ink_mobile/messenger/model/message.dart';

class DeleteMessageSenderModel extends Equatable {
  final List<Message> messages;
  final int initiator;
  final String token;
  const DeleteMessageSenderModel({
    this.messages = const [],
    this.initiator = 0,
    this.token = '',
  });

  DeleteMessageSenderModel copyWith({
    List<Message>? messages,
    int? initiator,
    String? token,
  }) {
    return DeleteMessageSenderModel(
      messages: messages ?? this.messages,
      initiator: initiator ?? this.initiator,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'messages': messages.map((x) => x.toMap()).toList(),
      'initiator': initiator,
      'token': token,
    };
  }

  factory DeleteMessageSenderModel.fromMap(Map<String, dynamic> map) {
    return DeleteMessageSenderModel(
      messages:
          List<Message>.from(map['messages']?.map((x) => Message.fromMap(x))),
      initiator: map['initiator']?.toInt() ?? 0,
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DeleteMessageSenderModel.fromJson(String source) =>
      DeleteMessageSenderModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'DeleteMessageSenderModel(messages: $messages, initiator: $initiator, token: $token)';

  @override
  List<Object> get props => [messages, initiator, token];

  static DeleteMessageSenderModel? fromJsonCustom(String source) {
    try {
      return DeleteMessageSenderModel.fromMap(json.decode(source));
    } catch (_) {
      return null;
    }
  }
}
