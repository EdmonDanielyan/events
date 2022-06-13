import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class ReadMessagesResponse {
  final bool success;
  final int status;
  final String token;

  const ReadMessagesResponse({
    this.success = false,
    this.status = 0,
    this.token = '',
  });

  factory ReadMessagesResponse.fromJson(Map<String, dynamic> json) =>
      _$ReadMessagesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ReadMessagesResponseToJson(this);
}
