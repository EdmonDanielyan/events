import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/errors.dart';
import 'package:ink_mobile/handlers/error_handlers.dart';

class ErrorCatcher {
  static ErrorCatcher? _instance;
  late ErrorHandler _handler;

  static ErrorCatcher getInstance() {
    if (_instance == null) {
      _instance = ErrorCatcher();
    }

    return _instance!;
  }

  ErrorHandler getHandlerByError(Object error) {
    if (error is AuthException) {
      return AuthErrorHandler();
    }

    if (error is NoConnectionException) {
      return NoConnectionHandler();
    }

    throw Exception('Error handler not found');
  }

  void onError(CustomException error, StackTrace stackTrace) {
    try {
      _handler = getHandlerByError(error);

      _handler.handle(error, stackTrace);
    } catch (e) {
      showErrorDialog(ErrorMessages.SIMPLE_ERROR_MESSAGE);
    }
  }

  ErrorHandler get currentHandler => _handler;
}
