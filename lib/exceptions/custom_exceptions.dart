import 'package:ink_mobile/assets/constants.dart';

abstract class CustomException implements FormatException {}

abstract class AuthException implements CustomException {}

class InvalidRefreshTokenException implements AuthException {
  String message;
  int? offset;
  dynamic source;

  InvalidRefreshTokenException({this.message = ''}) : super();
}

class NoConnectionException implements CustomException {
  String message;
  int? offset;
  dynamic source;

  NoConnectionException(
      {this.message = ErrorMessages.NO_CONNECTION_ERROR_MESSAGE})
      : super();
}

class UnknownErrorException implements CustomException {
  String message;
  int? offset;
  dynamic source;

  UnknownErrorException({this.message = ErrorMessages.UNKNOWN_ERROR_MESSAGE})
      : super();
}
