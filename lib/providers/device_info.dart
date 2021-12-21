import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoProvider {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  Future<String?> getDeviceId() async {
    if (Platform.isIOS) {
      final info = await deviceInfo.iosInfo;
      return info.identifierForVendor ?? "";
    } else if (Platform.isAndroid) {
      final info = await deviceInfo.androidInfo;
      return info.androidId ?? "";
    }

    return null;
  }
}
