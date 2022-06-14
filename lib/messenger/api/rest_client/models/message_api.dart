import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:ink_mobile/messenger/model/message.dart';
import 'package:ink_mobile/messenger/model/user.dart';

part 'message_api.g.dart';

@JsonSerializable()
class MessageApi extends Equatable {
  final int id;
  final int type;
  @JsonKey(name: "userId")
  final int userId;
  @JsonKey(name: "chatId")
  final int chatId;
  final String message;
  final bool read;
  final bool edited;
  @JsonKey(name: "responseTo")
  final MessageApi? responseTo;
  @JsonKey(name: "updatedAt")
  final String updatedAt;
  @JsonKey(name: "createdAt")
  final String createdAt;
  const MessageApi({
    this.id = 0,
    this.type = 0,
    this.userId = 0,
    this.chatId = 0,
    this.message = '',
    this.read = false,
    this.edited = false,
    this.responseTo,
    this.updatedAt = '',
    this.createdAt = '',
  });

  factory MessageApi.fromJson(Map<String, dynamic> json) =>
      _$MessageApiFromJson(json);
  Map<String, dynamic> toJson() => _$MessageApiToJson(this);

  MessageApi copyWith({
    int? id,
    int? type,
    int? userId,
    int? chatId,
    String? message,
    bool? read,
    bool? edited,
    MessageApi? responseTo,
    String? updatedAt,
    String? createdAt,
  }) {
    return MessageApi(
      id: id ?? this.id,
      type: type ?? this.type,
      userId: userId ?? this.userId,
      chatId: chatId ?? this.chatId,
      message: message ?? this.message,
      read: read ?? this.read,
      edited: edited ?? this.edited,
      responseTo: responseTo ?? this.responseTo,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'userId': userId,
      'chatId': chatId,
      'message': message,
      'read': read,
      'edited': edited,
      'responseTo': responseTo?.toMap(),
      'updatedAt': updatedAt,
      'createdAt': createdAt,
    };
  }

  factory MessageApi.fromMap(Map<String, dynamic> map) {
    return MessageApi(
      id: map['id']?.toInt() ?? 0,
      type: map['type']?.toInt() ?? 0,
      userId: map['userId']?.toInt() ?? 0,
      chatId: map['chatId']?.toInt() ?? 0,
      message: map['message'] ?? '',
      read: map['read'] ?? false,
      edited: map['edited'] ?? false,
      responseTo: map['responseTo'] != null
          ? MessageApi.fromMap(map['responseTo'])
          : null,
      updatedAt: map['updatedAt'] ?? '',
      createdAt: map['createdAt'] ?? '',
    );
  }

  @override
  String toString() {
    return 'MessageApi(id: $id, type: $type, userId: $userId, chatId: $chatId, message: $message, read: $read, edited: $edited, responseTo: $responseTo, updatedAt: $updatedAt, createdAt: $createdAt)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      type,
      userId,
      chatId,
      message,
      read,
      edited,
      responseTo,
      updatedAt,
      createdAt,
    ];
  }

  Message toLocal({required int myId}) {
    List<int> readBy = [userId];

    if (read) {
      readBy.add(myId);
    }

    return Message(
      id: id,
      body: message,
      owner: User(id: userId),
      chatId: chatId,
      edited: edited,
      updatedAt: DateTime.tryParse(updatedAt) ?? DateTime.now(),
      createdAt: DateTime.tryParse(createdAt) ?? DateTime.now(),
      type: MessageType.values.length >= type + 1
          ? MessageType.values[type]
          : MessageType.text,
      responseTo: responseTo?.toLocal(myId: myId),
      readBy: readBy,
      status: MessageStatus.sent,
    );
  }
}
