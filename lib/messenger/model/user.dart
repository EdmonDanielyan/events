import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:ink_mobile/models/absence.dart';
import 'package:ink_mobile/models/user_data.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String avatarUrl;
  final Absence? absence;
  final String? workPosition;
  final DateTime? birthday;
  const User({
    this.id = 0,
    this.name = '',
    this.avatarUrl = '',
    this.absence,
    this.workPosition,
    this.birthday,
  });

  User copyWith({
    int? id,
    String? name,
    String? avatarUrl,
    Absence? absence,
    String? workPosition,
    DateTime? birthday,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      absence: absence ?? this.absence,
      workPosition: workPosition ?? this.workPosition,
      birthday: birthday ?? this.birthday,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'avatarUrl': avatarUrl,
      'absence': absence,
      'work_position': workPosition,
      'birthday': birthday.toString(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      avatarUrl: map['avatarUrl'] ?? '',
      absence: map['absence'] != null ? Absence.fromMap(map['absence']) : null,
      workPosition: map['work_position'],
      birthday: map['birthday'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  factory User.fromUserProfileData(UserProfileData userData) {
    return User(
      id: userData.id,
      name: "${userData.name ?? ""} ${userData.lastName ?? ""}",
      avatarUrl: userData.pathToAvatar ?? "",
      absence: userData.absence,
      workPosition: userData.workPosition,
    );
  }

  @override
  String toString() =>
      'User(id: $id, name: $name, avatarUrl: $avatarUrl, absence: ${absence?.reason ?? ""}, work position: $workPosition), birthday: $birthday';

  @override
  List<Object> get props => [id, name, avatarUrl];
}
