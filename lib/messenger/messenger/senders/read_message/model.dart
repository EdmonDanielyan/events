import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:ink_mobile/messenger/model/message.dart';

class ReadMessageModel extends Equatable {
  final Message lastMessage;
  final int initiatorId;
  final String token;
  const ReadMessageModel({
    required this.lastMessage,
    this.initiatorId = 0,
    this.token = '',
  });

  ReadMessageModel copyWith({
    Message? lastMessage,
    int? initiatorId,
    String? token,
  }) {
    return ReadMessageModel(
      lastMessage: lastMessage ?? this.lastMessage,
      initiatorId: initiatorId ?? this.initiatorId,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lastMessage': lastMessage.toMap(),
      'initiatorId': initiatorId,
      'token': token,
    };
  }

  factory ReadMessageModel.fromMap(Map<String, dynamic> map) {
    return ReadMessageModel(
      lastMessage: Message.fromMap(map['lastMessage']),
      initiatorId: map['initiatorId']?.toInt() ?? 0,
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ReadMessageModel.fromJson(String source) =>
      ReadMessageModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ReadMessageModel(lastMessage: $lastMessage, initiatorId: $initiatorId, token: $token)';

  @override
  List<Object> get props => [lastMessage, initiatorId, token];

  static ReadMessageModel? fromJsonCustom(String source) {
    try {
      return ReadMessageModel.fromMap(json.decode(source));
    } catch (_) {
      return null;
    }
  }
}
