import 'package:dio/dio.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/error_response.dart';

class DioErrorHandler {
  LanguageStrings languageStrings;
  final DioError e;

  DioErrorHandler({required this.e, required this.languageStrings});

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
      print(response);

      switch (response.code) {
        case "QMA-6":
          return invalidRefreshToken();
        case "QMA-15":
          return unknownErrorException(
              languageStrings.userNotFound, languageStrings.userNotFound);
        default:
          return unknownErrorException(languageStrings.errorOccurred, "");
      }
    }

    return noConnection();
  }

  ErrorModel invalidRefreshToken() {
    return ErrorModel(
      msg: languageStrings.errorOccurred,
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
      msg: languageStrings.noConnectionError,
      exception: NoConnectionException(),
    );
  }
}
