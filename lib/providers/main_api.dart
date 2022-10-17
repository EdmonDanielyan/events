// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/constants/timeouts.dart';
import 'package:main_api_client/api.dart';

@lazySingleton
class MainApiProvider extends MainApiClient {
  HttpClient? _sslPinnedHttpClient(HttpClient client) {
    SecurityContext securityContext = SecurityContext();
    return HttpClient(context: securityContext);
  }

  MainApiProvider(@Named("apiUrl") String apiUrl)
      : super(basePathOverride: apiUrl) {
    dio.options.connectTimeout = API_CONNECT_TIMEOUT_MS;
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        _sslPinnedHttpClient;
  }
}

@lazySingleton
class MainApiExLogProvider extends MainApiClient {
  HttpClient? _sslPinnedHttpClient(HttpClient client) {
    SecurityContext securityContext = SecurityContext();
    return HttpClient(context: securityContext);
  }

  MainApiExLogProvider(@Named("apiUrl") String apiUrl)
      : super(basePathOverride: apiUrl) {
    dio.options.connectTimeout = API_CONNECT_TIMEOUT_MS;
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        _sslPinnedHttpClient;
  }
}
