import 'dart:convert';

import 'package:equatable/equatable.dart';

class UpdateChatRequest extends Equatable {
  final String name;
  final String description;
  final String avatarUrl;

  const UpdateChatRequest({
    this.name = '',
    this.description = "",
    this.avatarUrl = '',
  });

  UpdateChatRequest copyWith({
    String? name,
    String? description,
    String? avatarUrl,
  }) {
    return UpdateChatRequest(
      name: name ?? this.name,
      description: description ?? this.description,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }

  @override
  String toString() =>
      'UpdateChatRequest(name: $name, description: $description, avatarUrl: $avatarUrl)';

  @override
  List<Object> get props => [name, description, avatarUrl];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'avatar_url': avatarUrl,
    };
  }

  factory UpdateChatRequest.fromMap(Map<String, dynamic> map) {
    return UpdateChatRequest(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      avatarUrl: map['avatar_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory UpdateChatRequest.fromJson(String source) =>
      UpdateChatRequest.fromMap(json.decode(source));
}
