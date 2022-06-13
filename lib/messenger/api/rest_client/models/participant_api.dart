import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'participant_api.g.dart';

@JsonSerializable()
class ParticipantApi extends Equatable {
  @JsonKey(name: "userId")
  final int userId;
  @JsonKey(name: "chatId")
  final int chatId;
  const ParticipantApi({
    this.userId = 0,
    this.chatId = 0,
  });

  factory ParticipantApi.fromJson(Map<String, dynamic> json) =>
      _$ParticipantApiFromJson(json);
  Map<String, dynamic> toJson() => _$ParticipantApiToJson(this);

  ParticipantApi copyWith({
    int? userId,
    int? chatId,
  }) {
    return ParticipantApi(
      userId: userId ?? this.userId,
      chatId: chatId ?? this.chatId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'chat_id': chatId,
    };
  }

  factory ParticipantApi.fromMap(Map<String, dynamic> map) {
    return ParticipantApi(
      userId: map['user_id']?.toInt() ?? 0,
      chatId: map['chat_id']?.toInt() ?? 0,
    );
  }

  @override
  String toString() => 'ParticipantApi(userId: $userId, chatId: $chatId)';

  @override
  List<Object> get props => [userId, chatId];
}
