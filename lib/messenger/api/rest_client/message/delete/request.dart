import 'dart:convert';

import 'package:equatable/equatable.dart';

class DeleteMessagesRequest extends Equatable {
  final List<int> messageIds;

  const DeleteMessagesRequest({
    this.messageIds = const [],
  });

  DeleteMessagesRequest copyWith({
    List<int>? messageIds,
  }) {
    return DeleteMessagesRequest(
      messageIds: messageIds ?? this.messageIds,
    );
  }

  @override
  String toString() => 'DeleteMessagesRequest(messageIds: $messageIds)';

  @override
  List<Object> get props => [messageIds];

  Map<String, dynamic> toMap() {
    return {
      'message_ids': messageIds,
    };
  }

  factory DeleteMessagesRequest.fromMap(Map<String, dynamic> map) {
    return DeleteMessagesRequest(
      messageIds: List<int>.from(map['message_ids']),
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory DeleteMessagesRequest.fromJson(String source) =>
      DeleteMessagesRequest.fromMap(json.decode(source));
}
