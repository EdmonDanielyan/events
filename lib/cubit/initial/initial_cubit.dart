import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/cubit/initial/initial_state.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:main_api_client/api.dart';
import 'package:dio/dio.dart';

class InitialCubit extends Cubit<InitialState> {
  InitialCubit() : super(InitialState(type: InitialStateType.LOADING));

  void fetch() async {
    try {
      String? refreshToken = await Token.getRefresh();

      if (refreshToken == null) {
        throw InvalidRefreshTokenException();
      }

      bool wasExpired = await Token.setNewTokensIfExpired();

      if (!wasExpired) {
        String? oldJwt = await Token.getJwt();
        MainApiClient api = MainApiClient();
        api.setOAuthToken('bearerAuth', oldJwt);
      }

      emitState(type: InitialStateType.LOAD_MAIN);
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        emitState(
          type: InitialStateType.ERROR,
          errorMessage: ErrorMessages.NO_CONNECTION_ERROR_MESSAGE
        );
      } else {
        emitState(
            type: InitialStateType.LOAD_WELCOME,
        );
      }
    } on InvalidRefreshTokenException catch (e) {
      emitState(type: InitialStateType.LOAD_WELCOME);
    } on Exception catch (e) {
      emitState(
          type: InitialStateType.ERROR,
          errorMessage: ErrorMessages.NO_CONNECTION_ERROR_MESSAGE
      );
    }
  }

  void refresh() {
    emitState(type: InitialStateType.LOADING);
  }

  void emitState({
    required InitialStateType type,
    String? errorMessage
  }) {
    emit(InitialState(
        type: type,
        errorMessage: errorMessage
    ));
  }
}