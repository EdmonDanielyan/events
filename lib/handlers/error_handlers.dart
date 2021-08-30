import 'package:flutter/material.dart';
import 'package:ink_mobile/app.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/errors.dart';

abstract class ErrorHandler {
  void handle(CustomException error, StackTrace stackTrace);
}

class AuthErrorHandler implements ErrorHandler {

  void handle(CustomException error, StackTrace stackTrace) {
    switch (error.runtimeType) {

      case InvalidRefreshTokenException: {
        Navigator.pushNamedAndRemoveUntil(
            App.materialKey!.currentContext!,
            '/auth',
            (route) => false
        );
        break;
      }

    }
  }

}

class NoConnectionHandler implements ErrorHandler {

  void handle(CustomException error, StackTrace stackTrace) {
    showErrorDialog(error.message);
  }

}