import 'dart:convert';

import 'package:collection/collection.dart';

class NotificationsDisabledChatsState {
  final Set<int> chatIds;
  const NotificationsDisabledChatsState({
    this.chatIds = const {},
  });

  NotificationsDisabledChatsState copyWith({
    Set<int>? chatIds,
  }) {
    return NotificationsDisabledChatsState(
      chatIds: chatIds ?? this.chatIds,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chatIds': chatIds.toList(),
    };
  }

  factory NotificationsDisabledChatsState.fromMap(Map<String, dynamic> map) {
    return NotificationsDisabledChatsState(
      chatIds: Set<int>.from(map['chatIds']),
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationsDisabledChatsState.fromJson(String source) =>
      NotificationsDisabledChatsState.fromMap(json.decode(source));

  @override
  String toString() => 'NotificationsDisabledChatsState(chatIds: $chatIds)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final setEquals = const DeepCollectionEquality().equals;

    return other is NotificationsDisabledChatsState &&
        setEquals(other.chatIds, chatIds);
  }

  @override
  int get hashCode => chatIds.hashCode;
}
