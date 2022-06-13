import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:ink_mobile/messenger/model/user.dart';

class OnlineState extends Equatable {
  final List<User> users;
  const OnlineState({
    this.users = const [],
  });

  OnlineState copyWith({
    List<User>? users,
  }) {
    return OnlineState(
      users: users ?? this.users,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'users': users.map((x) => x.toMap()).toList(),
    };
  }

  factory OnlineState.fromMap(Map<String, dynamic> map) {
    return OnlineState(
      users: List<User>.from(map['users']?.map((x) => User.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory OnlineState.fromJson(String source) =>
      OnlineState.fromMap(json.decode(source));

  @override
  String toString() => 'OnlineState(users: $users)';

  @override
  List<Object> get props => [users];
}
