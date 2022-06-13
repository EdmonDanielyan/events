import 'dart:convert';

import 'package:equatable/equatable.dart';

class InviteChatRequest extends Equatable {
  final int chatId;
  final List<int> users;

  const InviteChatRequest({
    this.chatId = 0,
    this.users = const [],
  });

  InviteChatRequest copyWith({
    int? chatId,
    List<int>? users,
  }) {
    return InviteChatRequest(
      chatId: chatId ?? this.chatId,
      users: users ?? this.users,
    );
  }

  @override
  String toString() => 'InviteChatRequest(chatId: $chatId, users: $users)';

  @override
  List<Object> get props => [chatId, users];

  Map<String, dynamic> toMap() {
    return {
      'chat_id': chatId,
      'users': users,
    };
  }

  factory InviteChatRequest.fromMap(Map<String, dynamic> map) {
    return InviteChatRequest(
      chatId: map['chat_id']?.toInt() ?? 0,
      users: List<int>.from(map['users']),
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory InviteChatRequest.fromJson(String source) =>
      InviteChatRequest.fromMap(json.decode(source));
}
