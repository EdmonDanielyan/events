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
      bool canCheckBios = await canCheckBiometrics();

      final biosOnly = await _authRequest(canCheckBios);

      return biosOnly;
    } on PlatformException catch (e, _) {
      logger.severe("ERROR during authenticate", e, _);
      if (e.code == auth_error.notAvailable) {
        return true;
      }

      return true;
    } catch (_e) {
      return true;
    }
  }

  Future<bool> _authRequest(bool canCheckBios) async {
    return await _localAuth.authenticate(
      localizedReason: canCheckBios ? localizationInstance.biometricReason : "",
      iOSAuthStrings: _iosStrings(),
      biometricOnly: true,
      sensitiveTransaction: false,
      androidAuthStrings:
          _androidStrings(biometricHint: localizationInstance.biometricHint),
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
