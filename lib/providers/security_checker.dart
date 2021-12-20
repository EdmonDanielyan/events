import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:safe_device/safe_device.dart';

@injectable
class SecurityChecker {
  const SecurityChecker();

  Future<bool> checkApplication() async {
    if (kDebugMode) {
      return true;
    } else {
      return !await SafeDevice.isSafeDevice;
    }
  }
}
