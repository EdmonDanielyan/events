import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

import 'package:ink_mobile/messenger/model/message.dart';

import 'user.dart';

enum ChatType { single, group }

class Chat extends Equatable {
  final int id;
  final String name;
  final String description;
  final int ownerId;
  final List<User> participants;
  final List<Message> messages;
  final String avatarUrl;
  final DateTime updatedAt;
  final DateTime createdAt;
  // enum
  final ChatType type;
  const Chat({
    this.id = 0,
    this.name = '',
    this.description = '',
    this.ownerId = 0,
    this.participants = const [],
    this.messages = const [],
    this.avatarUrl = '',
    required this.updatedAt,
    required this.createdAt,
    this.type = ChatType.single,
  });

  Chat copyWith({
    int? id,
    String? name,
    String? description,
    int? ownerId,
    List<User>? participants,
    List<Message>? messages,
    String? avatarUrl,
    DateTime? updatedAt,
    DateTime? createdAt,
    ChatType? type,
  }) {
    return Chat(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      ownerId: ownerId ?? this.ownerId,
      participants: participants ?? this.participants,
      messages: messages ?? this.messages,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'ownerId': ownerId,
      'participants': participants.map((x) => x.toMap()).toList(),
      'messages': messages.map((x) => x.toMap()).toList(),
      'avatarUrl': avatarUrl,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'type': type.index,
    };
  }

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      ownerId: map['ownerId']?.toInt() ?? 0,
      participants:
          List<User>.from(map['participants']?.map((x) => User.fromMap(x))),
      messages:
          List<Message>.from(map['messages']?.map((x) => Message.fromMap(x))),
      avatarUrl: map['avatarUrl'] ?? '',
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt']),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      type: ChatType.values[map['type'] ?? 0],
    );
  }

  String toJson() => json.encode(toMap());

  factory Chat.fromJson(String source) => Chat.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Chat(id: $id, name: $name, description: $description, ownerId: $ownerId, participants: $participants, messages: $messages, avatarUrl: $avatarUrl, updatedAt: $updatedAt, createdAt: $createdAt, type: $type)';
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      description,
      ownerId,
      participants,
      messages,
      avatarUrl,
      updatedAt,
      createdAt,
      type,
    ];
  }

  bool get isGroup => type == ChatType.group;
  bool get isSingle => type == ChatType.single;

  static Chat? fromJsonCustom(String source) {
    try {
      return Chat.fromMap(json.decode(source));
    } catch (_e) {
      return null;
    }
  }

  int getFirstNotMyId(int myId) {
    final participant =
        participants.firstWhereOrNull((element) => element.id != myId);

    return participant?.id ?? 0;
  }

  bool isOwner(int id) {
    return ownerId == id;
  }

  void sortMessagesByTime() {
    messages.sort((a, b) => a.id.compareTo(b.id));
  }
}
