import 'package:dio/dio.dart';

class ErrorResponse {
  final bool success = false;

  String host;
  String version;
  String returned;
  String type;
  String instance;
  String title;
  String detail;
  int status;
  String code;
  dynamic responseData = {};

  ErrorResponse(
      {this.host = '',
      this.version = '',
      this.returned = '',
      this.type = '',
      this.instance = '',
      this.title = '',
      this.detail = '',
      this.status = 0,
      this.code = '',
      this.responseData});

  String toString() {
    return responseData.toString();
  }

  factory ErrorResponse.fromException(DioError error) {
    dynamic response = error.response?.data;
    try {
      return ErrorResponse(
          host: response['host'] ?? '',
          version: response['version'] ?? '',
          returned: response['returned'] ?? '',
          type: response['type'] ?? '',
          instance: response['instance'] ?? '',
          title: response['title'] ?? '',
          detail: response['detail'] ?? '',
          status: response['status'] ?? -1,
          code: response['code'] ?? '',
          responseData: response ?? {});
    } catch (_) {
      dynamic statusCode = error.response?.statusCode ?? 500;
      return ErrorResponse(
          detail: response, status: statusCode, code: statusCode);
    }
  }
}
