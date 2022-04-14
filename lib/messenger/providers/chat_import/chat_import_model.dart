import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/database/schema/message_table_schema.dart';

class ChatImportModel {
  final List<ChatTable> chats;
  final List<MessageTable> messages;
  final List<ChannelTable> channels;
  final List<ParticipantTable> participants;
  final List<UserTable> users;
  const ChatImportModel({
    required this.chats,
    required this.messages,
    required this.channels,
    required this.participants,
    required this.users,
  });

  ChatImportModel copyWith({
    List<ChatTable>? chats,
    List<MessageTable>? messages,
    List<ChannelTable>? channels,
    List<ParticipantTable>? participants,
    List<UserTable>? users,
  }) {
    return ChatImportModel(
      chats: chats ?? this.chats,
      messages: messages ?? this.messages,
      channels: channels ?? this.channels,
      participants: participants ?? this.participants,
      users: users ?? this.users,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chats': chats.map((x) => x.toJson()).toList(),
      'messages': messages.map((x) => x.toJson()).toList(),
      'channels': channels.map((x) => x.toJson()).toList(),
      'participants': participants.map((x) => x.toJson()).toList(),
      'users': users.map((x) => x.toJson()).toList(),
    };
  }

  Map<String, dynamic> toMapCustom() {
    return {
      'chats': chats.map((x) => x.toJson()).toList(),
      'messages':
          messages.map((x) => MessageTableSchema.toJson(message: x)).toList(),
      'channels': channels.map((x) => x.toJson()).toList(),
      'participants': participants.map((x) => x.toJson()).toList(),
      'users': users.map((x) => x.toJson()).toList(),
    };
  }

  factory ChatImportModel.fromMap(Map<String, dynamic> map) {
    return ChatImportModel(
      chats:
          List<ChatTable>.from(map['chats']?.map((x) => ChatTable.fromJson(x))),
      messages: List<MessageTable>.from(
          map['messages']?.map((x) => MessageTableSchema.fromJson(x))),
      channels: List<ChannelTable>.from(
          map['channels']?.map((x) => ChannelTable.fromJson(x))),
      participants: List<ParticipantTable>.from(
          map['participants']?.map((x) => ParticipantTable.fromJson(x))),
      users:
          List<UserTable>.from(map['users']?.map((x) => UserTable.fromJson(x))),
    );
  }

  String toJson() => json.encode(toMap());
  String toJsonCustom() => json.encode(toMapCustom());

  factory ChatImportModel.fromJson(String source) =>
      ChatImportModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatImportModel(chats: $chats, messages: $messages, channels: $channels, participants: $participants, users: $users)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatImportModel &&
        listEquals(other.chats, chats) &&
        listEquals(other.messages, messages) &&
        listEquals(other.channels, channels) &&
        listEquals(other.participants, participants) &&
        listEquals(other.users, users);
  }

  @override
  int get hashCode {
    return chats.hashCode ^
        messages.hashCode ^
        channels.hashCode ^
        participants.hashCode ^
        users.hashCode;
  }
}
