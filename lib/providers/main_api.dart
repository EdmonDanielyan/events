import 'dart:io';
import 'package:dio/io.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/constants/timeouts.dart';
import 'package:ink_mobile/setup.dart';
import 'package:ink_mobile/utils/app_config.dart';
import 'package:openapi/openapi.dart';

@lazySingleton
class MainApiProvider extends Openapi {
  HttpClient _sslPinnedHttpClient() {
    SecurityContext securityContext = SecurityContext();
    return HttpClient(context: securityContext);
  }

  MainApiProvider()
      : super(basePathOverride: getIt.get<AppConfig>().serverUrl) {
    dio.options.connectTimeout =
        const Duration(seconds: API_CONNECT_TIMEOUT_MS);
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      return _sslPinnedHttpClient();
    };
  }
}
