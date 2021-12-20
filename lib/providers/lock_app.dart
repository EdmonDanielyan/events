import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

@singleton
class LockApp {
  late LocalAuthentication _localAuth;
  LockApp() {
    _localAuth = LocalAuthentication();
  }

  Future<bool> canCheckBiometrics() async =>
      await _localAuth.canCheckBiometrics;

  Future<void> init() async {
    await authentificate();
  }

  Future<bool> authentificate() async {
    try {
      if (await canCheckBiometrics()) {
        bool didAuthenticate = await _localAuth.authenticate(
          localizedReason: localizationInstance.passwordHint,
          iOSAuthStrings: _iosStrings(),
          androidAuthStrings: _androidStrings(),
        );

        return didAuthenticate;
      }
    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        return true;
      }
      print("ERROR $e");
    }

    return false;
  }

  Future<bool> stopAuthentification() async {
    return await _localAuth.stopAuthentication();
  }

  IOSAuthMessages _iosStrings() {
    return IOSAuthMessages(
      cancelButton: localizationInstance.cancel,
      goToSettingsButton: localizationInstance.settings,
      goToSettingsDescription: localizationInstance.touchIdSetup,
      lockOut: localizationInstance.reenableTouchId,
    );
  }

  AndroidAuthMessages _androidStrings() {
    return AndroidAuthMessages(
      signInTitle: localizationInstance.authenticationRequired,
      biometricHint: localizationInstance.passwordHint,
      cancelButton: localizationInstance.cancel,
      goToSettingsButton: localizationInstance.settings,
      goToSettingsDescription: localizationInstance.touchIdSetup,
    );
  }
}
