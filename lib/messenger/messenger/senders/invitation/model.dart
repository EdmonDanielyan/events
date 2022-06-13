import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:ink_mobile/messenger/model/chat.dart';

class InvitationSenderModel extends Equatable {
  final Chat chat;
  final String token;
  const InvitationSenderModel({
    required this.chat,
    this.token = '',
  });

  InvitationSenderModel copyWith({
    Chat? chat,
    String? token,
  }) {
    return InvitationSenderModel(
      chat: chat ?? this.chat,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chat': chat.toMap(),
      'token': token,
    };
  }

  factory InvitationSenderModel.fromMap(Map<String, dynamic> map) {
    return InvitationSenderModel(
      chat: Chat.fromMap(map['chat']),
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory InvitationSenderModel.fromJson(String source) =>
      InvitationSenderModel.fromMap(json.decode(source));

  @override
  String toString() => 'InvitationSenderModel(chat: $chat, token: $token)';

  @override
  List<Object> get props => [chat, token];

  static InvitationSenderModel? fromJsonCustom(String source) {
    try {
      return InvitationSenderModel.fromMap(json.decode(source));
    } catch (_) {
      return null;
    }
  }
}
