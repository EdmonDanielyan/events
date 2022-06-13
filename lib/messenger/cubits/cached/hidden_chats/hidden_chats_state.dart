import 'dart:convert';

import 'package:collection/collection.dart';

class HiddenChatsState {
  final Set<int> chatIds;
  const HiddenChatsState({
    this.chatIds = const {},
  });

  HiddenChatsState copyWith({
    Set<int>? chatIds,
  }) {
    return HiddenChatsState(
      chatIds: chatIds ?? this.chatIds,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chatIds': chatIds.toList(),
    };
  }

  factory HiddenChatsState.fromMap(Map<String, dynamic> map) {
    return HiddenChatsState(
      chatIds: Set<int>.from(map['chatIds']),
    );
  }

  String toJson() => json.encode(toMap());

  factory HiddenChatsState.fromJson(String source) =>
      HiddenChatsState.fromMap(json.decode(source));

  @override
  String toString() => 'HiddenChatsState(chatIds: $chatIds)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final setEquals = const DeepCollectionEquality().equals;

    return other is HiddenChatsState && setEquals(other.chatIds, chatIds);
  }

  @override
  int get hashCode => chatIds.hashCode;
}
