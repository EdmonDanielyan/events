import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:ink_mobile/messenger/model/user.dart';

class AddParticipantModel extends Equatable {
  final int chatId;
  final List<User> users;
  final String token;
  const AddParticipantModel({
    this.chatId = 0,
    this.users = const [],
    this.token = '',
  });

  AddParticipantModel copyWith({
    int? chatId,
    List<User>? users,
    String? token,
  }) {
    return AddParticipantModel(
      chatId: chatId ?? this.chatId,
      users: users ?? this.users,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chatId': chatId,
      'users': users.map((x) => x.toMap()).toList(),
      'token': token,
    };
  }

  factory AddParticipantModel.fromMap(Map<String, dynamic> map) {
    return AddParticipantModel(
      chatId: map['chatId']?.toInt() ?? 0,
      users: List<User>.from(map['users']?.map((x) => User.fromMap(x))),
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AddParticipantModel.fromJson(String source) =>
      AddParticipantModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'AddParticipantModel(chatId: $chatId, users: $users, token: $token)';

  @override
  List<Object> get props => [chatId, users, token];

  static AddParticipantModel? fromJsonCustom(String source) {
    try {
      return AddParticipantModel.fromMap(json.decode(source));
    } catch (_) {
      return null;
    }
  }
}
