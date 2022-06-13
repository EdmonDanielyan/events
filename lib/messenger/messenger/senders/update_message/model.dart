import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:ink_mobile/messenger/model/message.dart';

class UpdateMessageSenderModel extends Equatable {
  final List<Message> messages;
  final int initiator;
  final String token;
  const UpdateMessageSenderModel({
    this.messages = const [],
    this.initiator = 0,
    this.token = '',
  });

  UpdateMessageSenderModel copyWith({
    List<Message>? messages,
    int? initiator,
    String? token,
  }) {
    return UpdateMessageSenderModel(
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

  factory UpdateMessageSenderModel.fromMap(Map<String, dynamic> map) {
    return UpdateMessageSenderModel(
      messages:
          List<Message>.from(map['messages']?.map((x) => Message.fromMap(x))),
      initiator: map['initiator']?.toInt() ?? 0,
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateMessageSenderModel.fromJson(String source) =>
      UpdateMessageSenderModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'UpdateMessageSenderModel(messages: $messages, initiator: $initiator, token: $token)';

  @override
  List<Object> get props => [messages, initiator, token];

  static UpdateMessageSenderModel? fromJsonCustom(String source) {
    try {
      return UpdateMessageSenderModel.fromMap(json.decode(source));
    } catch (_) {
      return null;
    }
  }
}
