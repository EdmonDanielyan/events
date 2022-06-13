import 'dart:convert';

import 'package:equatable/equatable.dart';

class UpdateMessageRequest extends Equatable {
  final String message;

  const UpdateMessageRequest({
    this.message = '',
  });

  UpdateMessageRequest copyWith({
    String? message,
  }) {
    return UpdateMessageRequest(
      message: message ?? this.message,
    );
  }

  @override
  String toString() => 'UpdateMessageRequest(message: $message)';

  @override
  List<Object> get props => [message];

  Map<String, dynamic> toMap() {
    return {
      'message': message,
    };
  }

  factory UpdateMessageRequest.fromMap(Map<String, dynamic> map) {
    return UpdateMessageRequest(
      message: map['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory UpdateMessageRequest.fromJson(String source) =>
      UpdateMessageRequest.fromMap(json.decode(source));
}
