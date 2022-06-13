import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:ink_mobile/messenger/model/user.dart';

enum MessageType { text, info }
enum MessageStatus { sending, sent, error }

class Message extends Equatable {
  final int id;
  final String body;
  final User owner;
  final int chatId;
  final bool edited;
  final DateTime updatedAt;
  final DateTime createdAt;
  // enum
  final MessageType type;
  final Message? responseTo;
  final List<int> readBy;
  // enum
  final MessageStatus status;
  const Message({
    this.id = 0,
    this.body = '',
    required this.owner,
    this.chatId = 0,
    this.edited = false,
    required this.updatedAt,
    required this.createdAt,
    this.type = MessageType.text,
    this.responseTo,
    this.readBy = const [],
    this.status = MessageStatus.sending,
  });

  Message copyWith({
    int? id,
    String? body,
    User? owner,
    int? chatId,
    bool? edited,
    DateTime? updatedAt,
    DateTime? createdAt,
    MessageType? type,
    Message? responseTo,
    List<int>? readBy,
    MessageStatus? status,
  }) {
    return Message(
      id: id ?? this.id,
      body: body ?? this.body,
      owner: owner ?? this.owner,
      chatId: chatId ?? this.chatId,
      edited: edited ?? this.edited,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      type: type ?? this.type,
      responseTo: responseTo ?? this.responseTo,
      readBy: readBy ?? this.readBy,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'body': body,
      'owner': owner.toMap(),
      'chatId': chatId,
      'edited': edited,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'type': type.index,
      'responseTo': responseTo?.toMap(),
      'readBy': readBy,
      'status': status.index,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id']?.toInt() ?? 0,
      body: map['body'] ?? '',
      owner: User.fromMap(map['owner']),
      chatId: map['chatId']?.toInt() ?? 0,
      edited: map['edited'] ?? false,
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt']),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      type: MessageType.values[map['type'] ?? 0],
      responseTo:
          map['responseTo'] != null ? Message.fromMap(map['responseTo']) : null,
      readBy: List<int>.from(map['readBy']),
      status: MessageStatus.values[map['status'] ?? 0],
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Message(id: $id, body: $body, owner: $owner, chatId: $chatId, edited: $edited, updatedAt: $updatedAt, createdAt: $createdAt, type: $type, responseTo: $responseTo, readBy: $readBy, status: $status)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      body,
      owner,
      chatId,
      edited,
      updatedAt,
      createdAt,
      type,
      responseTo,
      readBy,
      status,
    ];
  }

  bool isByMe(int myId) => owner.id == myId;

  static Message? fromJsonCustom(String source) {
    try {
      return Message.fromMap(json.decode(source));
    } catch (_) {
      return null;
    }
  }

  bool get isInfo => type == MessageType.info;

  bool isReadByMe(int userId) => readBy.contains(userId);
  bool get isReadByOthers => readBy.length >= 2;
}
