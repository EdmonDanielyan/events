import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ink_mobile/messenger/api/rest_client/models/message_api.dart';
import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/messenger/model/user.dart';

part 'chat_api.g.dart';

@JsonSerializable()
class ChatApi extends Equatable {
  final int id;
  final int type;
  @JsonKey(name: "ownerId")
  final int ownerId;
  final String name;
  final String description;
  @JsonKey(name: "avatarUrl")
  final String avatarUrl;
  final List<int> participants;
  final MessageApi? message;
  @JsonKey(name: "updatedAt")
  final String updatedAt;
  @JsonKey(name: "createdAt")
  final String createdAt;

  const ChatApi({
    this.id = 0,
    this.type = 0,
    this.ownerId = 0,
    this.name = '',
    this.description = '',
    this.avatarUrl = '',
    this.participants = const [],
    this.message,
    this.updatedAt = '',
    this.createdAt = '',
  });

  factory ChatApi.fromJson(Map<String, dynamic> json) =>
      _$ChatApiFromJson(json);
  Map<String, dynamic> toJson() => _$ChatApiToJson(this);

  ChatApi copyWith({
    int? id,
    int? type,
    int? ownerId,
    String? name,
    String? description,
    String? avatarUrl,
    List<int>? participants,
    MessageApi? message,
    String? updatedAt,
    String? createdAt,
  }) {
    return ChatApi(
      id: id ?? this.id,
      type: type ?? this.type,
      ownerId: ownerId ?? this.ownerId,
      name: name ?? this.name,
      description: description ?? this.description,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      participants: participants ?? this.participants,
      message: message ?? this.message,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'ownerId': ownerId,
      'name': name,
      'description': description,
      'avatarUrl': avatarUrl,
      'participants': participants,
      'message': message?.toMap(),
      'updatedAt': updatedAt,
      'createdAt': createdAt,
    };
  }

  factory ChatApi.fromMap(Map<String, dynamic> map) {
    return ChatApi(
      id: map['id']?.toInt() ?? 0,
      type: map['type']?.toInt() ?? 0,
      ownerId: map['ownerId']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      avatarUrl: map['avatarUrl'] ?? '',
      participants: List<int>.from(map['participants']),
      message:
          map['message'] != null ? MessageApi.fromMap(map['message']) : null,
      updatedAt: map['updatedAt'] ?? '',
      createdAt: map['createdAt'] ?? '',
    );
  }

  @override
  String toString() {
    return 'ChatApi(id: $id, type: $type, ownerId: $ownerId, name: $name, description: $description, avatarUrl: $avatarUrl, participants: $participants, message: $message, updatedAt: $updatedAt, createdAt: $createdAt)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      type,
      ownerId,
      name,
      description,
      avatarUrl,
      participants,
      message,
      updatedAt,
      createdAt,
    ];
  }

  Chat toLocal({List<User>? newParticipants, required int myId}) {
    return Chat(
      id: id,
      name: name,
      description: description,
      ownerId: ownerId,
      participants: newParticipants ??
          participants
              .map(
                (e) => User(id: e),
              )
              .toList(),
      messages: message != null ? [message!.toLocal(myId: myId)] : [],
      avatarUrl: avatarUrl,
      updatedAt: DateTime.tryParse(updatedAt) ?? DateTime.now(),
      createdAt: DateTime.tryParse(createdAt) ?? DateTime.now(),
      type: ChatType.values.length >= type + 1
          ? ChatType.values[type]
          : ChatType.group,
    );
  }
}
