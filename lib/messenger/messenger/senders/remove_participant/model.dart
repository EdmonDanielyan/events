import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:ink_mobile/messenger/model/user.dart';

class RemoveParticipantModel extends Equatable {
  final int chatId;
  final List<User> users;
  final int initiatorId;
  final String token;
  const RemoveParticipantModel({
    this.chatId = 0,
    this.users = const [],
    required this.initiatorId,
    this.token = '',
  });

  RemoveParticipantModel copyWith({
    int? chatId,
    List<User>? users,
    int? initiatorId,
    String? token,
  }) {
    return RemoveParticipantModel(
      chatId: chatId ?? this.chatId,
      users: users ?? this.users,
      initiatorId: initiatorId ?? this.initiatorId,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chatId': chatId,
      'users': users.map((x) => x.toMap()).toList(),
      'initiatorId': initiatorId,
      'token': token,
    };
  }

  factory RemoveParticipantModel.fromMap(Map<String, dynamic> map) {
    return RemoveParticipantModel(
      chatId: map['chatId']?.toInt() ?? 0,
      users: List<User>.from(map['users']?.map((x) => User.fromMap(x))),
      initiatorId: map['initiatorId']?.toInt() ?? 0,
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RemoveParticipantModel.fromJson(String source) =>
      RemoveParticipantModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RemoveParticipantModel(chatId: $chatId, users: $users, initiatorId: $initiatorId, token: $token)';
  }

  @override
  List<Object> get props => [chatId, users, initiatorId, token];

  static RemoveParticipantModel? fromJsonCustom(String source) {
    try {
      return RemoveParticipantModel.fromMap(json.decode(source));
    } catch (_) {
      return null;
    }
  }
}
