import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/handlers/AuthHandler.dart';
import 'package:ink_mobile/core/token/set_token.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/certificate_reader.dart';
import 'package:ink_mobile/providers/security_checker.dart';
import 'package:ink_mobile/screens/initial/cubit/initial_state.dart';

@injectable
class InitialCubit extends Cubit<InitialState> {
  final SecurityChecker securityChecker;
  final CertificateReader certificateReader;
  final AuthHandler authHandler;

  InitialCubit(this.securityChecker, this.certificateReader, this.authHandler)
      : super(InitialState(type: InitialStateType.LOADING));

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

  Future<void> init() async {}

  Future<void> fetch() async {
    try {
      if (await securityChecker.checkApplication()) {
        await certificateReader.read();
        await refreshToken();
        await wasTokenExpired();
        authHandler.onSuccessAuth(checkLock: true);
        emitState(type: InitialStateType.LOAD_MAIN);
      } else {
        emitError(localizationInstance.applicationSecurityFailed);
      }
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
    fetch();
  }

  void emitState({required InitialStateType type, String? errorMessage}) {
    emit(InitialState(type: type, errorMessage: errorMessage));
  }
}
