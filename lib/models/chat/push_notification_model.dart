import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';

class ChatPushNotificationModel {
  final int userId;
  final String title;
  final String body;
  final String chatId;
  ChatPushNotificationModel({
    required this.userId,
    required this.title,
    required this.body,
    required this.chatId,
  });

  ChatPushNotificationModel copyWith({
    int? userId,
    String? title,
    String? body,
    String? chatId,
  }) {
    return ChatPushNotificationModel(
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
      chatId: chatId ?? this.chatId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'title': title,
      'body': body,
      'chatId': chatId,
    };
  }

  Map<String, String> toMapString() {
    return {
      'userId': userId.toString(),
      'title': title,
      'body': body,
      'chatId': chatId,
    };
  }

  factory ChatPushNotificationModel.fromMap(Map<String, dynamic> map) {
    return ChatPushNotificationModel(
      userId: map['user_id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
      chatId: map['chat_id'] ?? '',
    );
  }

  factory ChatPushNotificationModel.fromMapString(Map<String, String> map) {
    return ChatPushNotificationModel(
      userId: int.tryParse((map['user_id'] ?? map['userId']) ?? "0") ?? 0,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
      chatId: (map['chat_id'] ?? map['chatId']) ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatPushNotificationModel.fromJson(String source) =>
      ChatPushNotificationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatPushNotificationModel(userId: $userId, title: $title, body: $body, chatId: $chatId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatPushNotificationModel &&
        other.userId == userId &&
        other.title == title &&
        other.body == body &&
        other.chatId == chatId;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ title.hashCode ^ body.hashCode ^ chatId.hashCode;
  }

  static ChatPushNotificationModel? fromRemoteMessage(RemoteMessage message) {
    Map<String, dynamic> data = {};

    try {
      data = jsonDecode(message.data['data']);
    } catch (_) {}

    try {
      data = jsonDecode(message.data['data']['data']);
    } catch (_) {}

    try {
      print(data);
      return ChatPushNotificationModel.fromMap(data);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }
}
