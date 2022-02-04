import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/handlers/AuthHandler.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/core/token/set_token.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/certificate_reader.dart';
import 'package:ink_mobile/providers/security_checker.dart';
import 'package:ink_mobile/screens/initial/cubit/initial_state.dart';

@injectable
class InitialCubit extends Cubit<InitialState> with Loggable {
  final SecurityChecker securityChecker;
  final CertificateReader certificateReader;
  final AuthHandler authHandler;

  InitialCubit(this.securityChecker, this.certificateReader, this.authHandler)
      : super(InitialState(type: InitialStateType.LOADING));

  Future<void> readRefreshToken() async {
    String? refreshToken = await Token.getRefresh();
    if (refreshToken == null) throw InvalidRefreshTokenException();
  }

  Future<bool> isTokenExpired() async {
    return await Token.setNewTokensIfExpired();
  }

  Future<void> updateToken() async {
    String? oldJwt = await Token.getJwt();
    SetOauthToken(token: oldJwt ?? "").setBearer();
  }

  Future<void> init() async {}

  Future<void> load() async {
    logger.finest('load');
    emitState(type: InitialStateType.LOADING);

    try {
      if (await securityChecker.checkApplication()) {
        await certificateReader.read();
        await readRefreshToken();
        if (await isTokenExpired()) {
          logger.finest('token is expired. Updating');
          await authHandler.authChallenge();
        } else {
          logger.finest('token is ok. Continue');
          await authHandler.byPassChallenge();
        }
        await updateToken();

        emitState(type: InitialStateType.LOAD_MAIN);
      } else {
        emitError(localizationInstance.applicationSecurityFailed);
      }
    } on InvalidRefreshTokenException catch (e) {
      logger.finest('Invalid refresh token', e);
      emitWelcome();
    } on DioError catch (e, s) {
      logger.severe('Error during load', e, s);
      if ([
        DioErrorType.connectTimeout,
        DioErrorType.receiveTimeout,
        DioErrorType.sendTimeout
      ].contains(e.type)) {
        emitError(localizationInstance.noConnectionError);
      } else {
        emitWelcome();
      }
    } on Exception catch (e, s) {
      logger.severe('Error during load', e, s);
      emitWelcome();
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
    load();
  }

  void emitState({required InitialStateType type, String? errorMessage}) {
    emit(InitialState(type: type, errorMessage: errorMessage));
  }
}
