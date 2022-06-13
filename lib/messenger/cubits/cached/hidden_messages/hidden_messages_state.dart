import 'dart:convert';

import 'package:collection/collection.dart';

class HiddenMessagesState {
  final Set<int> messages;
  const HiddenMessagesState({
    this.messages = const {},
  });

  HiddenMessagesState copyWith({
    Set<int>? messages,
  }) {
    return HiddenMessagesState(
      messages: messages ?? this.messages,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'messages': messages.toList(),
    };
  }

  factory HiddenMessagesState.fromMap(Map<String, dynamic> map) {
    return HiddenMessagesState(
      messages: Set<int>.from(map['messages']),
    );
  }

  String toJson() => json.encode(toMap());

  factory HiddenMessagesState.fromJson(String source) =>
      HiddenMessagesState.fromMap(json.decode(source));

  @override
  String toString() => 'HiddenMessagesState(messages: $messages)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final setEquals = const DeepCollectionEquality().equals;

    return other is HiddenMessagesState && setEquals(other.messages, messages);
  }

  @override
  int get hashCode => messages.hashCode;
}
