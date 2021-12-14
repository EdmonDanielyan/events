import 'dart:io';
import 'dart:typed_data';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:main_api_client/api.dart';

@lazySingleton
class MainApiProvider extends MainApiClient {
  final Uint8List certificate;

  HttpClient? _sslPinnedHttpClient(HttpClient client) {
    SecurityContext securityContext = SecurityContext();
    securityContext.setTrustedCertificatesBytes(certificate);
    return HttpClient(context: securityContext);
  }

  MainApiProvider(LogInterceptor logInterceptor, @Named("apiUrl") String apiUrl,
      @Named("apiCertificate") this.certificate)
      : super(basePathOverride: apiUrl) {
    dio.interceptors.add(logInterceptor);
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        _sslPinnedHttpClient;
  }
}

@lazySingleton
class LogInterceptor extends Interceptor with Loggable {
  @override
  void onRequest(options, handler) {
    var _request = """\n
        Request: ${options.uri}
        Method: ${options.method}
        Headers: ${options.headers}
        Data: ${options.data}
        """;
    logger.info(_request);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(response, handler) {
    var _response = """\n
        Response from: ${response.realUri}
        HTTP Status: ${response.statusCode}
        Data: ${response.data}
        """;
    logger.info(_response);
    super.onResponse(response, handler);
  }

  @override
  void onError(err, handler) {
    var _error = """\n
        Error message: ${err.message}
        HTTP Status: ${err.response?.statusCode}
        Response Data: ${err.response}
        Headers: ${err.response?.headers}
        Request Uri: ${err.requestOptions.uri}
        Request Data: ${err.requestOptions.data}
        Request Headers: ${err.requestOptions.headers}
        """;
    logger.severe(_error, err, err.stackTrace);
    super.onError(err, handler);
  }
}
