import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

@singleton
class LockApp with Loggable {
  late LocalAuthentication _localAuth;
  LockApp() {
    _localAuth = LocalAuthentication();
  }

  Future<bool> canCheckBiometrics() async =>
      await _localAuth.canCheckBiometrics;

  Future<List<BiometricType>> getAvailableBiometrics() async {
    return _localAuth.getAvailableBiometrics();
  }

  Future<void> init() async {
    await authenticate();
  }

  Future<bool> authenticate({bool throwError = false}) async {
    try {
      bool canCheckBios = await canCheckBiometrics();

      final biosOnly = await _authRequest(canCheckBios);

      return biosOnly;
    } on PlatformException catch (e, _) {
      logger.severe("ERROR during authenticate", e, _);

      if (throwError) {
        throw PlatformException(code: e.code);
      }

      if (e.code == auth_error.notAvailable ||
          e.code == auth_error.notEnrolled ||
          e.code == auth_error.passcodeNotSet) {
        return true;
      }

      return false;
    } catch (_e) {
      return true;
    }
  }

  Future<bool> _authRequest(bool canCheckBios) async {
    return await _localAuth.authenticate(
      localizedReason: canCheckBios ? localizationInstance.biometricReason : "",
      authMessages: [
        _iosStrings(),
        _androidStrings(biometricHint: localizationInstance.biometricHint)
      ],
      options: const AuthenticationOptions(
        // useErrorDialogs: true,
        // stickyAuth: false,
        // sensitiveTransaction: false,
        biometricOnly: true,
      ),
    );
  }

  Future<bool> stopAuthentification() async {
    try {
      return await _localAuth.stopAuthentication();
    } catch (_) {
      return true;
    }
  }

  IOSAuthMessages _iosStrings() {
    return IOSAuthMessages(
      cancelButton: localizationInstance.cancel,
      goToSettingsButton: localizationInstance.settings,
      goToSettingsDescription: localizationInstance.touchIdSetup,
      lockOut: localizationInstance.reEnableTouchId,
    );
  }

  AndroidAuthMessages _androidStrings({String? biometricHint}) {
    return AndroidAuthMessages(
      signInTitle: localizationInstance.authenticationRequired,
      biometricHint: biometricHint,
      cancelButton: localizationInstance.cancel,
      goToSettingsButton: localizationInstance.settings,
      goToSettingsDescription: localizationInstance.touchIdSetup,
    );
  }
}
