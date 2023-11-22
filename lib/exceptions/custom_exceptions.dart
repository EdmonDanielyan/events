import '../constants/error_messages.dart';

//todo: снести всю иерархию классов

abstract class CustomException implements FormatException {}

abstract class AuthException implements CustomException {}

class InvalidRefreshTokenException implements AuthException {
  @override
  String message;
  @override
  int? offset;
  @override
  dynamic source;

  InvalidRefreshTokenException({this.message = ''}) : super();
}

class NoConnectionException implements CustomException {
  @override
  String message;
  @override
  int? offset;
  @override
  dynamic source;

  NoConnectionException(
      {this.message = ErrorMessages.NO_CONNECTION_ERROR_MESSAGE})
      : super();
}

class UnknownErrorException implements CustomException {
  @override
  String message;
  @override
  int? offset;
  @override
  dynamic source;

  UnknownErrorException({this.message = ErrorMessages.UNKNOWN_ERROR_MESSAGE})
      : super();
}

class WrongChannelUsedToPubMessageException implements CustomException {
  @override
  String message;
  @override
  int? offset;
  @override
  dynamic source;

  WrongChannelUsedToPubMessageException({this.message = ''}) : super();
}

class SubscriptionAlreadyExistException implements CustomException {
  @override
  String message;
  @override
  int? offset;
  @override
  dynamic source;

  SubscriptionAlreadyExistException({this.message = ''}) : super();
}
