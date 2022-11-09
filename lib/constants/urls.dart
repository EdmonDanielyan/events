import 'package:flutter/foundation.dart';

class UrlsConfig {
  static const prodUrl = "https://portal.irkutskoil.ru/api/v1/";
  static const debugUrl = "https://test.ink.vpool.qsoft.ru/api/v1";

  static String get apiUrl => kDebugMode ? debugUrl : prodUrl;
}
