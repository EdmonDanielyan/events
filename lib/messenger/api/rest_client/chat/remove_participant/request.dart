import 'dart:convert';

import 'package:equatable/equatable.dart';

class RemoveParticipantRequest extends Equatable {
  final int chatId;
  final int user;

  const RemoveParticipantRequest({
    this.chatId = 0,
    this.user = 0,
  });

  RemoveParticipantRequest copyWith({
    int? chatId,
    int? user,
  }) {
    return RemoveParticipantRequest(
      chatId: chatId ?? this.chatId,
      user: user ?? this.user,
    );
  }

  @override
  String toString() => 'RemoveParticipantRequest(chatId: $chatId, user: $user)';

  @override
  List<Object> get props => [chatId, user];

  Map<String, dynamic> toMap() {
    return {
      'chat_id': chatId,
      'user_id': user,
    };
  }

  factory RemoveParticipantRequest.fromMap(Map<String, dynamic> map) {
    return RemoveParticipantRequest(
      chatId: map['chat_id']?.toInt() ?? 0,
      user: map['user_id']?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory RemoveParticipantRequest.fromJson(String source) =>
      RemoveParticipantRequest.fromMap(json.decode(source));
}
