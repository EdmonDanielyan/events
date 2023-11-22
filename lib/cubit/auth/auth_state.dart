import 'package:flutter/material.dart';

enum AuthStateType { LOADING, LOADED, ERROR }

@immutable
class AuthState {
  final AuthStateType type;
  final String? errorMessage;

  const AuthState({required this.type, this.errorMessage})
      : assert(
            type != AuthStateType.ERROR ||
                (type == AuthStateType.ERROR && errorMessage != null),
            'errorMessage must not be null in error state');
}
