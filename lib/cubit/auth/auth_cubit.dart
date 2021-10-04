import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/auth/domain/repository.dart';
import 'package:ink_mobile/cubit/auth/use_cases/auth.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/cubit/auth/auth_state.dart';
import 'package:dio/dio.dart';

class AuthCubit extends Cubit<AuthState> {
  LanguageStrings languageStrings;
  AuthCubit({required this.languageStrings})
      : super(AuthState(type: AuthStateType.LOADED));

  String login = '';
  String password = '';

  Future<bool> auth() async {
    emitState(type: AuthStateType.LOADING);
    try {
      AuthUser authUser = AuthUser(
        dependency:
            AuthRepository(login: login, password: password).getDependency(),
      );
      final response = await authUser.call();

      return authUser.handleResponse(response);
    } on TimeoutException catch (_) {
      emitError(languageStrings.noConnectionError);
      throw FormatException(languageStrings.noConnectionError);
    } on DioError catch (e) {
      String message = (e.type == DioErrorType.response)
          ? e.response?.data['detail']
          : languageStrings.noConnectionError;

      emitError(message);
      throw FormatException(message);
    } on Exception catch (_) {
      emitError(languageStrings.unknownError);
      throw FormatException(languageStrings.unknownError);
    }
  }

  void emitError(String errorMsg) {
    emitState(type: AuthStateType.ERROR, errorMessage: errorMsg);
  }

  emitState({required AuthStateType type, String? errorMessage}) {
    emit(AuthState(type: type, errorMessage: errorMessage));
  }
}
