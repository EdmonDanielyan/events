import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';

@singleton
class LockApp with Loggable {
  late LocalAuthentication _localAuth;
  LockApp() {
    _localAuth = LocalAuthentication();
  }

  Future<bool> canCheckBiometrics() async =>
      await _localAuth.canCheckBiometrics;

  Future<void> init() async {
    await authenticate();
  }

  Future<bool> authenticate() async {
    try {
      if (await canCheckBiometrics()) {
        bool didAuthenticate = await _localAuth.authenticate(
          localizedReason: localizationInstance.biometricReason,
          iOSAuthStrings: _iosStrings(),
          androidAuthStrings: _androidStrings(
              biometricHint: localizationInstance.biometricHint),
        );

        return didAuthenticate;
      } else {
        bool didAuthenticate = await _localAuth.authenticate(
          localizedReason: "",
          iOSAuthStrings: _iosStrings(),
          androidAuthStrings: _androidStrings(biometricHint: null),
        );

        return didAuthenticate;
      }
    } on PlatformException catch (e, s) {
      if (e.code == auth_error.notAvailable) {
        return true;
      }

      if (e.code == "auth_in_progress") {
        await Future.delayed(Duration(milliseconds: 100));
      }
      logger.severe("ERROR during authenticate", e, s);
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
