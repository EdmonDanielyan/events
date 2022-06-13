import 'dart:convert';

import 'package:equatable/equatable.dart';

class CreateChatRequest extends Equatable {
  final String name;
  final int ownerId;
  final List<int> participants;
  final String avatarUrl;
  final int type;

  const CreateChatRequest({
    this.name = '',
    this.ownerId = 0,
    this.participants = const [],
    this.avatarUrl = '',
    this.type = 0,
  });

  CreateChatRequest copyWith({
    String? name,
    int? ownerId,
    List<int>? participants,
    String? avatarUrl,
    int? type,
  }) {
    return CreateChatRequest(
      name: name ?? this.name,
      ownerId: ownerId ?? this.ownerId,
      participants: participants ?? this.participants,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      type: type ?? this.type,
    );
  }

  @override
  String toString() {
    return 'CreateChatRequest(name: $name, ownerId: $ownerId, participants: $participants, avatarUrl: $avatarUrl, type: $type)';
  }

  @override
  List<Object> get props {
    return [
      name,
      ownerId,
      participants,
      avatarUrl,
      type,
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'ownerId': ownerId,
      'participants': participants,
      'avatarUrl': avatarUrl,
      'type': type,
    };
  }

  factory CreateChatRequest.fromMap(Map<String, dynamic> map) {
    return CreateChatRequest(
      name: map['name'] ?? '',
      ownerId: map['ownerId']?.toInt() ?? 0,
      participants: List<int>.from(map['participants']),
      avatarUrl: map['avatarUrl'] ?? '',
      type: map['type']?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory CreateChatRequest.fromJson(String source) =>
      CreateChatRequest.fromMap(json.decode(source));
}
