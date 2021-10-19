import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ink_mobile/core/handlers/AuthHandler.dart';
import 'package:ink_mobile/core/token/set_token.dart';
import 'package:ink_mobile/cubit/initial/initial_state.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:dio/dio.dart';

class InitialCubit extends Cubit<InitialState> {
  InitialCubit() : super(InitialState(type: InitialStateType.LOADING));

  Future<void> refreshToken() async {
    String? refreshToken = await Token.getRefresh();
    if (refreshToken == null) throw InvalidRefreshTokenException();
  }

  Future<void> wasTokenExpired() async {
    bool wasExpired = await Token.setNewTokensIfExpired();

    if (!wasExpired) {
      String? oldJwt = await Token.getJwt();
      SetOauthToken(token: oldJwt ?? "").setBearer();
    }
  }

  Future<void> fetch() async {
    try {
      await refreshToken();
      await wasTokenExpired();
      GetIt.I<AuthHandler>().onSuccessAuth();
      emitState(type: InitialStateType.LOAD_MAIN);
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        emitError(localizationInstance.noConnectionError);
      } else {
        emitWelcome();
      }
    } on InvalidRefreshTokenException catch (_) {
      emitWelcome();
    } on Exception catch (_) {
      emitError(localizationInstance.noConnectionError);
    }
  }

  void emitWelcome() {
    emitState(type: InitialStateType.LOAD_WELCOME);
  }

  void emitError(String errorMsg) {
    emitState(type: InitialStateType.ERROR, errorMessage: errorMsg);
  }

  void refresh() {
    emitState(type: InitialStateType.LOADING);
  }

  void emitState({required InitialStateType type, String? errorMessage}) {
    emit(InitialState(type: type, errorMessage: errorMessage));
  }
}
