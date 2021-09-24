import 'package:dio/dio.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/error_response.dart';

class DioErrorHandler {
  LanguageStrings languageStrings;
  final DioError e;

  DioErrorHandler({required this.e, required this.languageStrings});

  ErrorModel call() {
    if (e.type == DioErrorType.response) {
      ErrorResponse response = ErrorResponse.fromException(e);

      if (response.code == 'QMA-6') {
        return ErrorModel(
            msg: languageStrings.errorOccuried,
            exception: InvalidRefreshTokenException());
      } else if (response.code == 'QMA-15') {
        return ErrorModel(
            msg: languageStrings.userNotFound,
            exception:
                UnknownErrorException(message: languageStrings.userNotFound));
      } else {
        return ErrorModel(
          msg: languageStrings.errorOccuried,
          exception: UnknownErrorException(),
        );
      }
    } else {
      return ErrorModel(
        msg: languageStrings.noConnectionError,
        exception: NoConnectionException(),
      );
    }
  }
}
