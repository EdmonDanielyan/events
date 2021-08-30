import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/cubit/auth/auth_state.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/api/auth_api.dart';
import 'package:main_api_client/model/auth_params.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/model/auth_success.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(
      AuthState(type: AuthStateType.LOADED)
  );

  String login = '';
  String password = '';

  Future<bool> auth() async {
    try {
      MainApiClient api = MainApiClient();
      AuthApi auth = api.getAuthApi();
      AuthParamsBuilder authBuilder = AuthParamsBuilder();

      authBuilder.login = login;
      authBuilder.password = password;
      AuthParams authParams = authBuilder.build();

      Response<AuthSuccess> response = await auth
          .auth(authParams: authParams)
          .timeout(Duration(seconds: 4));

      Map? responseData = response.data?.data.asMap;

      if (responseData != null) {
        String token = responseData['token'];
        String refreshToken = responseData['refresh_token'];

        api.setOAuthToken('bearerAuth', token);

        await Token.setRefresh(refreshToken);
        await Token.setJwt(token);

        return true;
      } else {
        return false;
      }

    } on TimeoutException catch (e) {
      emitState(
          type: AuthStateType.ERROR,
          errorMessage: ErrorMessages.NO_CONNECTION_ERROR_MESSAGE
      );

      throw FormatException(ErrorMessages.NO_CONNECTION_ERROR_MESSAGE);
    } on DioError catch (e) {
      String message =
        (e.type == DioErrorType.response)
          ? e.response?.data['detail']
          : ErrorMessages.NO_CONNECTION_ERROR_MESSAGE;

      emitState(
          type: AuthStateType.ERROR,
          errorMessage: message
      );
      throw FormatException(message);
    } on Exception catch (e) {
      emitState(
          type: AuthStateType.ERROR,
          errorMessage: ErrorMessages.UNKNOWN_ERROR_MESSAGE
      );

      throw FormatException(
          ErrorMessages.UNKNOWN_ERROR_MESSAGE
      );
    }
  }

  emitState({
    required AuthStateType type,
    String? errorMessage
  }) {
    emit(AuthState(type: type, errorMessage: errorMessage));
  }
}
