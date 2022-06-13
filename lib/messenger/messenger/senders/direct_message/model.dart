import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:ink_mobile/messenger/model/message.dart';

class DirectMessageSenderModel extends Equatable {
  final List<Message> messages;
  final int toUser;
  final String token;
  const DirectMessageSenderModel({
    this.messages = const [],
    this.toUser = 0,
    this.token = "",
  });

  DirectMessageSenderModel copyWith({
    List<Message>? messages,
    int? toUser,
    String? token,
  }) {
    return DirectMessageSenderModel(
      messages: messages ?? this.messages,
      toUser: toUser ?? this.toUser,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'messages': messages.map((x) => x.toMap()).toList(),
      'toUser': toUser,
      'token': token,
    };
  }

  factory DirectMessageSenderModel.fromMap(Map<String, dynamic> map) {
    return DirectMessageSenderModel(
      messages:
          List<Message>.from(map['messages']?.map((x) => Message.fromMap(x))),
      toUser: map['toUser']?.toInt() ?? 0,
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DirectMessageSenderModel.fromJson(String source) =>
      DirectMessageSenderModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'DirectMessageSenderModel(messages: $messages, toUser: $toUser, token: $token)';

  @override
  List<Object> get props => [messages, toUser, token];

  static DirectMessageSenderModel? fromJsonCustom(String source) {
    try {
      return DirectMessageSenderModel.fromMap(json.decode(source));
    } catch (_) {
      return null;
    }
  }
}
