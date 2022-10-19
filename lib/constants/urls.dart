import 'package:flutter/foundation.dart';

class UrlsConfig {
  static const _apiUrl = "https://portal.irkutskoil.ru/api/v1/";
  static const _apiUrlDebug = "https://test.ink.vpool.qsoft.ru/api/v1";

  static String get apiUrl => kDebugMode ? _apiUrlDebug : _apiUrl;
}
