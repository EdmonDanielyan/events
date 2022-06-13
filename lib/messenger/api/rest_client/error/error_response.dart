import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable()
class ErrorApiResponse {
  int? status;
  String? title;
  ErrorApiResponse({this.status, this.title});

  factory ErrorApiResponse.fromJson(Map<String, dynamic> json) {
    return _$ErrorApiResponseFromJson(json);
  }
  Map<String, dynamic> toJson() => _$ErrorApiResponseToJson(this);

  String get getErrorMessage => title ?? "";
}

@JsonSerializable()
class ErrorApiResponseData {
  String message;

  ErrorApiResponseData({required this.message});

  factory ErrorApiResponseData.fromJson(Map<String, dynamic> json) =>
      _$ErrorApiResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorApiResponseDataToJson(this);
}
