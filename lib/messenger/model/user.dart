import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:ink_mobile/models/user_data.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String avatarUrl;
  const User({
    this.id = 0,
    this.name = '',
    this.avatarUrl = '',
  });

  User copyWith({
    int? id,
    String? name,
    String? avatarUrl,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'avatarUrl': avatarUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      avatarUrl: map['avatarUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  factory User.fromUserProfileData(UserProfileData userData) {
    return User(
      id: userData.id,
      name: "${userData.name ?? "" } ${userData.lastName ?? "" }",
      avatarUrl: userData.pathToAvatar ?? "",
    );
  }

  @override
  String toString() => 'User(id: $id, name: $name, avatarUrl: $avatarUrl)';

  @override
  List<Object> get props => [id, name, avatarUrl];
}
