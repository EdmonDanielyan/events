// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/constants/timeouts.dart';
import 'package:ink_mobile/setup.dart';
import 'package:ink_mobile/utils/app_config.dart';
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@lazySingleton
class MainApiProvider extends Openapi {
  HttpClient? _sslPinnedHttpClient(HttpClient client) {
    SecurityContext securityContext = SecurityContext();
    return HttpClient(context: securityContext);
  }

  MainApiProvider() : super(basePathOverride: getIt.get<AppConfig>().serverUrl) {
    dio.options.connectTimeout = API_CONNECT_TIMEOUT_MS;
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        _sslPinnedHttpClient;
  }
}
