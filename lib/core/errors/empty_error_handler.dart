import 'package:dio/dio.dart';
import 'package:ink_mobile/models/error_response.dart';

class DioEmptyHandler {
  final DioError e;

  DioEmptyHandler({required this.e});

  bool isEmpty() {
    if (e.type == DioErrorType.response) {
      ErrorResponse response = ErrorResponse.fromException(e);

      if (response.code == 'QMA-32' || response.code == 'QMA-33') {
        return true;
      }
    }

    return false;
  }
}
