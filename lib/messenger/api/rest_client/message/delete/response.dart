import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class DeleteMessagesResponse {
  final bool success;
  final int status;
  final String token;

  const DeleteMessagesResponse({
    this.success = false,
    this.status = 0,
    this.token = '',
  });

  factory DeleteMessagesResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteMessagesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteMessagesResponseToJson(this);
}
