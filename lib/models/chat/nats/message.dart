import 'dart:convert';

import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message.dart';

class ChatMessageFields {
  final String channel;
  final MessageTable message;
  final UserTable user;
  final ChatTable chat;

  ChatMessageFields({
    required this.channel,
    required this.message,
    required this.user,
    required this.chat,
  });

  Map<String, String> toMap() {
    return {
      'channel': channel,
      'message': MessageListView.toJsonString(message),
      'user': user.toJsonString(),
      'chat': chat.toJsonString(),
    };
  }

  factory ChatMessageFields.fromMap(Map<String, dynamic> map) {
    return ChatMessageFields(
      channel: map['channel'],
      message: MessageListView.fromString(map['message']),
      user: UserTable.fromJson(jsonDecode(map['user'])),
      chat: ChatTable.fromJson(jsonDecode(map['chat'])),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessageFields.fromJson(String source) =>
      ChatMessageFields.fromMap(json.decode(source));

  ChatMessageFields copyWith({
    String? channel,
    MessageTable? message,
    UserTable? user,
    ChatTable? chat,
  }) {
    return ChatMessageFields(
      channel: channel ?? this.channel,
      message: message ?? this.message,
      user: user ?? this.user,
      chat: chat ?? this.chat,
    );
  }

  @override
  String toString() =>
      'ChatMessageFields(channel: $channel, message: $message, user: $user, chat: $chat)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatMessageFields &&
        other.channel == channel &&
        other.message == message &&
        other.user == user &&
        other.chat == chat;
  }

  @override
  int get hashCode =>
      channel.hashCode ^ message.hashCode ^ user.hashCode ^ chat.hashCode;
}
