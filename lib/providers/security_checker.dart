import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:safe_device/safe_device.dart';

@injectable
class SecurityChecker {
  const SecurityChecker();
  //todo: Перед выдачей в сторы раскоментировать
  Future<bool> checkApplication() async {
    if (kDebugMode) {
      return true;
    } else {
      return Platform.isIOS
          ? !await SafeDevice.isJailBroken
          : !await SafeDevice.isSafeDevice;
    }
  }
}
