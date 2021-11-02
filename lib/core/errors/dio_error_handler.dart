import 'package:dio/dio.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/error_response.dart';

class DioErrorHandler {
  final DioError e;

  DioErrorHandler({required this.e});

  List<String> emptyResponseCodes = ["QMA-32", "QMA-33"];

  bool isEmpty() {
    if (e.type == DioErrorType.response) {
      ErrorResponse response = ErrorResponse.fromException(e);

      for (var code in emptyResponseCodes)
        if (code == response.code) return true;
    }

    return false;
  }

  ErrorModel call() {
    if (e.type == DioErrorType.response) {
      ErrorResponse response = ErrorResponse.fromException(e);
      switch (response.code) {
        case "QMA-6":
          return invalidRefreshToken();
        case "QMA-13":
          return unknownErrorException(response.title, response.detail);
        case "QMA-15":
          return unknownErrorException(localizationInstance.userNotFound,
              localizationInstance.userNotFound);
        default:
          return unknownErrorException(localizationInstance.errorOccurred, "");
      }
    }

    return noConnection();
  }

  ErrorModel invalidRefreshToken() {
    return ErrorModel(
      msg: localizationInstance.errorOccurred,
      exception: InvalidRefreshTokenException(),
    );
  }

  ErrorModel unknownErrorException(String msg, String exceptionMsg) {
    return ErrorModel(
      msg: msg,
      exception: UnknownErrorException(message: exceptionMsg),
    );
  }

  ErrorModel noConnection() {
    return ErrorModel(
      msg: localizationInstance.noConnectionError,
      exception: NoConnectionException(),
    );
  }
}
