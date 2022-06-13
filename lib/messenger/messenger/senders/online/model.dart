import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:ink_mobile/messenger/model/user.dart';

class OnlineModel extends Equatable {
  final User user;

  const OnlineModel({
    required this.user,
  });

  OnlineModel copyWith({
    User? user,
  }) {
    return OnlineModel(
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user.toMap(),
    };
  }

  factory OnlineModel.fromMap(Map<String, dynamic> map) {
    return OnlineModel(
      user: User.fromMap(map['user']),
    );
  }

  String toJson() => json.encode(toMap());

  factory OnlineModel.fromJson(String source) =>
      OnlineModel.fromMap(json.decode(source));

  @override
  String toString() => 'OnlineModel(user: $user)';

  @override
  List<Object> get props => [user];

  static OnlineModel? fromJsonCustom(String source) {
    try {
      return OnlineModel.fromMap(json.decode(source));
    } catch (_) {
      return null;
    }
  }
}
