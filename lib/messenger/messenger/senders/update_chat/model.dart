import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:ink_mobile/messenger/model/chat.dart';

class UpdateChatModel extends Equatable {
  final Chat chat;
  final int initiator;
  final String token;
  const UpdateChatModel({
    required this.chat,
    this.initiator = 0,
    this.token = '',
  });

  UpdateChatModel copyWith({
    Chat? chat,
    int? initiator,
    String? token,
  }) {
    return UpdateChatModel(
      chat: chat ?? this.chat,
      initiator: initiator ?? this.initiator,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chat': chat.toMap(),
      'initiator': initiator,
      'token': token,
    };
  }

  factory UpdateChatModel.fromMap(Map<String, dynamic> map) {
    return UpdateChatModel(
      chat: Chat.fromMap(map['chat']),
      initiator: map['initiator']?.toInt() ?? 0,
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateChatModel.fromJson(String source) =>
      UpdateChatModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'UpdateChatModel(chat: $chat, initiator: $initiator, token: $token)';

  @override
  List<Object> get props => [chat, initiator, token];

  static UpdateChatModel? fromJsonCustom(String source) {
    try {
      return UpdateChatModel.fromMap(json.decode(source));
    } catch (_) {
      return null;
    }
  }
}
