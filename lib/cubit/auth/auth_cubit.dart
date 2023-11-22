import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/constants/error_messages.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/auth/sources/network.dart';
import 'package:ink_mobile/cubit/auth/auth_state.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/setup.dart';
import 'package:ink_mobile/extensions/auth_success.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(type: AuthStateType.LOADED));

  String login = '';
  String password = '';

  Future<bool> auth() async {
    emitState(type: AuthStateType.LOADING);
    try {
      final response = await getIt<AuthNetworkRequest>(
          param1: login.trim(), param2: password.trim())();
      return await response.handleResponse();
    } on TimeoutException catch (_) {
      emitError(localizationInstance.noConnectionError);
      throw FormatException(localizationInstance.noConnectionError);
    } on DioException catch (e) {
      ErrorModel error = DioErrorHandler(e: e).call();
      if (error.exception is UnknownErrorException) {
        emitError(ErrorMessages.AUTH_ERROR_MESSAGE);
      } else {
        emitError(error.msg);
      }
      throw error.exception;
    } on Exception catch (_) {
      emitError(localizationInstance.unknownError);
      throw FormatException(localizationInstance.unknownError);
    }
  }

  void emitError(String errorMsg) {
    emitState(type: AuthStateType.ERROR, errorMessage: errorMsg);
  }

  void clearErrors() {
    emitState(type: AuthStateType.LOADED, errorMessage: null);
  }

  emitState({required AuthStateType type, String? errorMessage}) {
    emit(AuthState(type: type, errorMessage: errorMessage));
  }
}
