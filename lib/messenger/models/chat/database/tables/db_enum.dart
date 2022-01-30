import 'package:json_annotation/json_annotation.dart';

part 'db_enum.g.dart';

@JsonEnum(alwaysCreate: true)
enum StoredMessageType {
  @JsonValue(0)
  NOT_DEFINED,
  @JsonValue(1)
  TEXT,
  @JsonValue(2)
  USER_LEFT,
  @JsonValue(3)
  USER_JOINED,
  @JsonValue(4)
  DOCUMENT
}

extension StoredMessageTypeExt on StoredMessageType {
  dynamic toJson() => _$StoredMessageTypeEnumMap[this];
}

StoredMessageType toStoredMessageType(dynamic value) =>
    _$StoredMessageTypeEnumMap.keys.firstWhere(
        (key) => _$StoredMessageTypeEnumMap[key] == value,
        orElse: () => _$StoredMessageTypeEnumMap.keys.first);

@JsonEnum(alwaysCreate: true)
enum MessageSentStatus {
  @JsonValue(0)
  EMPTY,
  @JsonValue(1)
  SENDING,
  @JsonValue(2)
  SENT,
  @JsonValue(3)
  ERROR
}

extension MessageSentStatusExt on MessageSentStatus {
  dynamic toJson() => _$MessageSentStatusEnumMap[this];
}

MessageSentStatus toMessageSentStatus(dynamic value) =>
    _$MessageSentStatusEnumMap.keys.firstWhere(
            (key) => _$MessageSentStatusEnumMap[key] == value,
        orElse: () => _$MessageSentStatusEnumMap.keys.first);


@JsonEnum(alwaysCreate: true)
enum MessageActions {
  @JsonValue(0)
  EMPTY,
  @JsonValue(1)
  FORWARDED,
  @JsonValue(2)
  EDITED,
  @JsonValue(3)
  DELETED
}

extension MessageActionsExt on MessageActions {
  dynamic toJson() => _$MessageActionsEnumMap[this];
}

MessageActions toMessageActions(dynamic value) =>
    _$MessageActionsEnumMap.keys.firstWhere(
            (key) => _$MessageActionsEnumMap[key] == value,
        orElse: () => _$MessageActionsEnumMap.keys.first);
