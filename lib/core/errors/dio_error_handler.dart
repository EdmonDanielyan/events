import 'package:dio/dio.dart';
import 'package:ink_mobile/constants/error_codes.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/error_response.dart';

class DioErrorHandler {
  final DioException e;

  DioErrorHandler({required this.e});

  List<String> emptyResponseCodes = [QMA_32, QMA_33];

  bool isEmpty() {
      //TODO response вместо unknown
    //https: //github.com/cfug/dio/blob/main/dio/migration_guide.md
    if (e.type == DioExceptionType.unknown) {
      ErrorResponse response = ErrorResponse.fromException(e);

      for (var code in emptyResponseCodes)
        if (code == response.code) return true;
    }

    return false;
  }

    ErrorModel call() {
    //TODO response вместо unknown
    //https: //github.com/cfug/dio/blob/main/dio/migration_guide.md
    if (e.type ==
        DioException.badResponse(
            statusCode: 400,
            requestOptions: RequestOptions(),
            response: Response(data: {
              "error": "Invalid request",
              "message": "Missing required parameters"
            }, statusCode: 400, requestOptions: RequestOptions()))) {
      ErrorResponse response = ErrorResponse.fromException(e);
      switch (response.code) {
        case QMA_6:
        case QMA_16:
          return invalidRefreshToken();
        case QMA_13:
          return unknownErrorException(response.title, response.detail);
        case QMA_15:
          return unknownErrorException(localizationInstance.userNotFound,
              localizationInstance.userNotFound);
        default:
          return unknownErrorException(
              localizationInstance.errorOccurred, response.detail);
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
