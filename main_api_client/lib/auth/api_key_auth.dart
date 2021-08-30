//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'dart:async';
import 'package:main_api_client/auth/auth.dart';
import 'package:dio/dio.dart';

class ApiKeyAuthInterceptor extends AuthInterceptor {
  Map<String, String> apiKeys = {};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final authInfo = getAuthInfo(options, 'apiKey');
    for (final info in authInfo) {
      final authName = info['name'] as String;
      final authKeyName = info['keyName'] as String;
      final authWhere = info['where'] as String;
      final apiKey = apiKeys[authName];
      if (apiKey != null) {
        if (authWhere == 'query') {
          options.queryParameters[authKeyName] = apiKey;
        } else {
          options.headers[authKeyName] = apiKey;
        }
        break;
      }
    }
    return super.onRequest(options, handler);
  }
}
