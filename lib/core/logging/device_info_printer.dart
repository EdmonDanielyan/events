import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

mixin DeviceInfoPrinter {
  Future<void> addDeviceInfo(File file) async {
    if (!kDebugMode) {
      return;
    }
    BaseDeviceInfo deviceInfo = await DeviceInfoPlugin().deviceInfo;
    var deviceMap = deviceInfo.toMap();
    var info = deviceMap.keys
        .map<String>((key) => "$key: ${deviceMap[key]}")
        .toList()
        .join("\n");
    file.writeAsStringSync('''
******************
$info
******************
''');
  }
}
