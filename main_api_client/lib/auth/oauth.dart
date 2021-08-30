//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'dart:async';
import 'package:main_api_client/auth/auth.dart';
import 'package:dio/dio.dart';

class OAuthInterceptor extends AuthInterceptor {
  Map<String, String> tokens = {};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final authInfo = getAuthInfo(options, 'http');
    for (final info in authInfo) {
      final token = tokens[info['name']];
      if (token != null) {
        options.headers['Authorization'] = 'Bearer ${token}';
        break;
      }
    }
    return super.onRequest(options, handler);
  }
}
