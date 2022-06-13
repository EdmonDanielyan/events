import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:ink_mobile/messenger/model/user.dart';

class CachedUsersState extends Equatable {
  final List<User> users;
  const CachedUsersState({
    this.users = const [],
  });

  CachedUsersState copyWith({
    List<User>? users,
  }) {
    return CachedUsersState(
      users: users ?? this.users,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'users': users.map((x) => x.toMap()).toList(),
    };
  }

  factory CachedUsersState.fromMap(Map<String, dynamic> map) {
    return CachedUsersState(
      users: List<User>.from(map['users']?.map((x) => User.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CachedUsersState.fromJson(String source) =>
      CachedUsersState.fromMap(json.decode(source));

  @override
  String toString() => 'CachedUsersState(users: $users)';

  @override
  List<Object> get props => [users];
}
