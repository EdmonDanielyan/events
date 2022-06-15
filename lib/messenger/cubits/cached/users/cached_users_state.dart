import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:ink_mobile/messenger/model/user.dart';

class CachedUsersState extends Equatable {
  final List<User> users;
  final DateTime lastCached;
  const CachedUsersState({
    this.users = const [],
    required this.lastCached,
  });

  CachedUsersState copyWith({
    List<User>? users,
    DateTime? lastCached,
  }) {
    return CachedUsersState(
      users: users ?? this.users,
      lastCached: lastCached ?? this.lastCached,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'users': users.map((x) => x.toMap()).toList(),
      'lastCached': lastCached.millisecondsSinceEpoch,
    };
  }

  factory CachedUsersState.fromMap(Map<String, dynamic> map) {
    return CachedUsersState(
      users: List<User>.from(map['users']?.map((x) => User.fromMap(x))),
      lastCached: DateTime.fromMillisecondsSinceEpoch(map['lastCached']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CachedUsersState.fromJson(String source) =>
      CachedUsersState.fromMap(json.decode(source));

  @override
  String toString() =>
      'CachedUsersState(users: $users, lastCached: $lastCached)';

  @override
  List<Object> get props => [users, lastCached];
}
