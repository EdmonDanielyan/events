import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../model/user.dart';

class ChatUsersPickerState extends Equatable {
  final List<User> users;
  const ChatUsersPickerState({
    this.users = const [],
  });

  ChatUsersPickerState copyWith({
    List<User>? users,
  }) {
    return ChatUsersPickerState(
      users: users ?? this.users,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'users': users.map((x) => x.toMap()).toList(),
    };
  }

  factory ChatUsersPickerState.fromMap(Map<String, dynamic> map) {
    return ChatUsersPickerState(
      users: List<User>.from(map['users']?.map((x) => User.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatUsersPickerState.fromJson(String source) =>
      ChatUsersPickerState.fromMap(json.decode(source));

  @override
  String toString() => 'ChatUsersPickerState(users: $users)';

  @override
  List<Object> get props => [users];
}
