import 'dart:io';

import 'package:device_info/device_info.dart';

class GetDeviceInfo {
  static Future<String?> getSimpleInfo() async {
    String? androidInfo = await getAndroidInfo();
    if (androidInfo != null) return androidInfo;

    String? iosInfo = await getIosInfo();
    if (iosInfo != null) return iosInfo;

    return null;
  }

  static Future<String?> getAndroidInfo() async {
    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return summarizeAndroidInfo(androidInfo);
    }

    return null;
  }

  static Future<String?> getIosInfo() async {
    if (Platform.isIOS) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      IosDeviceInfo info = await deviceInfo.iosInfo;
      return summarizeIosInfo(info);
    }

    return null;
  }

  static String summarizeIosInfo(IosDeviceInfo info) {
    List<String> list = [];
    list.add("model: ${info.model}");
    list.add("name: ${info.name}");
    list.add("isPhysicalDevice: ${info.isPhysicalDevice}");
    list.add("systemName: ${info.systemName}");
    list.add("systemVersion: ${info.systemVersion}");

    return list.join("; ").trim();
  }

  static String summarizeAndroidInfo(AndroidDeviceInfo info) {
    List<String> list = [];
    list.add("model: ${info.model}");
    list.add("brand: ${info.brand}");
    list.add("device: ${info.device}");
    list.add("isPhysicalDevice: ${info.isPhysicalDevice}");
    list.add("product: ${info.product}");
    list.add("OS: Android");
    list.add("version: ${info.version.release}");

    return list.join("; ").trim();
  }
}
