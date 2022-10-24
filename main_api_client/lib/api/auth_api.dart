//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/json_object.dart';

import 'package:main_api_client/model/auth_success.dart';
import 'package:main_api_client/model/register_success.dart';
import 'package:main_api_client/model/register_confirm_success.dart';
import 'package:main_api_client/model/forbidden.dart';
import 'package:main_api_client/model/logout_params.dart';
import 'package:main_api_client/model/server_error.dart';
import 'package:main_api_client/model/register_confirm_params.dart';
import 'package:main_api_client/model/refresh_token_params.dart';
import 'package:main_api_client/model/register_params.dart';
import 'package:main_api_client/model/bad_request.dart';
import 'package:main_api_client/model/user_not_found.dart';
import 'package:main_api_client/model/bad_auth_params.dart';
import 'package:main_api_client/model/auth_params.dart';
import 'package:main_api_client/model/not_found.dart';
import 'package:main_api_client/model/required_success.dart';

class AuthApi {
  final Dio _dio;
  Serializers _serializers;

  AuthApi(this._dio, this._serializers);

  /// Авторизация
  ///
  ///
  Future<Response<AuthSuccess>> auth({
    AuthParams authParams,
    CancelToken cancelToken,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    ValidateStatus validateStatus,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final String _path = '/auth/login';

    final queryParams = <String, dynamic>{};
    final headerParams = <String, dynamic>{
      if (headers != null) ...headers,
    };
    dynamic bodyData;

    queryParams.removeWhere((key, dynamic value) => value == null);
    headerParams.removeWhere((key, dynamic value) => value == null);

    final contentTypes = <String>[
      'application/json',
    ];

    final bodySerializer =
        _serializers.serializerForType(AuthParams) as Serializer<AuthParams>;
    final serializedBody =
        _serializers.serializeWith(bodySerializer, authParams);
    final jsonauthParams = json.encode(serializedBody);
    bodyData = jsonauthParams;

    return _dio
        .request<dynamic>(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
        headers: headerParams,
        extra: <String, dynamic>{
          'secure': <Map<String, String>>[],
          if (extra != null) ...extra,
        },
        validateStatus: validateStatus,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    )
        .then((response) {
      final serializer = _serializers.serializerForType(AuthSuccess)
          as Serializer<AuthSuccess>;
      final data = _serializers.deserializeWith<AuthSuccess>(
        serializer,
        response.data is String
            ? jsonDecode(response.data as String)
            : response.data,
      );

      return Response<AuthSuccess>(
        data: data,
        headers: response.headers,
        requestOptions: response.requestOptions,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }

  /// Выход из профиля
  ///
  ///
  Future<Response<RequiredSuccess>> authLogoutPost({
    LogoutParams logoutParams,
    CancelToken cancelToken,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    ValidateStatus validateStatus,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final String _path = '/auth/logout';

    final queryParams = <String, dynamic>{};
    final headerParams = <String, dynamic>{
      if (headers != null) ...headers,
    };
    dynamic bodyData;

    queryParams.removeWhere((key, dynamic value) => value == null);
    headerParams.removeWhere((key, dynamic value) => value == null);

    final contentTypes = <String>[
      'application/json',
    ];

    final bodySerializer = _serializers.serializerForType(LogoutParams)
        as Serializer<LogoutParams>;
    final serializedBody =
        _serializers.serializeWith(bodySerializer, logoutParams);
    final jsonlogoutParams = json.encode(serializedBody);
    bodyData = jsonlogoutParams;

    return _dio
        .request<dynamic>(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
        headers: headerParams,
        extra: <String, dynamic>{
          'secure': <Map<String, String>>[],
          if (extra != null) ...extra,
        },
        validateStatus: validateStatus,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    )
        .then((response) {
      final serializer = _serializers.serializerForType(RequiredSuccess)
          as Serializer<RequiredSuccess>;
      final data = _serializers.deserializeWith<RequiredSuccess>(
        serializer,
        response.data is String
            ? jsonDecode(response.data as String)
            : response.data,
      );

      return Response<RequiredSuccess>(
        data: data,
        headers: response.headers,
        requestOptions: response.requestOptions,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }

  /// Продление JWT токена по refresh token
  ///
  ///
  Future<Response<AuthSuccess>> authRefreshPost({
    RefreshTokenParams refreshTokenParams,
    CancelToken cancelToken,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    ValidateStatus validateStatus,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final String _path = '/auth/refresh';

    final queryParams = <String, dynamic>{};
    final headerParams = <String, dynamic>{
      if (headers != null) ...headers,
    };
    dynamic bodyData;

    queryParams.removeWhere((key, dynamic value) => value == null);
    headerParams.removeWhere((key, dynamic value) => value == null);

    final contentTypes = <String>[
      'application/json',
    ];

    final bodySerializer = _serializers.serializerForType(RefreshTokenParams)
        as Serializer<RefreshTokenParams>;
    final serializedBody =
        _serializers.serializeWith(bodySerializer, refreshTokenParams);
    final jsonrefreshTokenParams = json.encode(serializedBody);
    bodyData = jsonrefreshTokenParams;

    return _dio
        .request<dynamic>(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
        headers: headerParams,
        extra: <String, dynamic>{
          'secure': <Map<String, String>>[],
          if (extra != null) ...extra,
        },
        validateStatus: validateStatus,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    )
        .then((response) {
      final serializer = _serializers.serializerForType(AuthSuccess)
          as Serializer<AuthSuccess>;
      final data = _serializers.deserializeWith<AuthSuccess>(
        serializer,
        response.data is String
            ? jsonDecode(response.data as String)
            : response.data,
      );

      return Response<AuthSuccess>(
        data: data,
        headers: response.headers,
        requestOptions: response.requestOptions,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }

  /// Подтверждение регистрации по коду из SMS
  ///
  ///
  Future<Response<RegisterConfirmSuccess>> authRegisterConfirmPost({
    RegisterConfirmParams registerConfirmParams,
    CancelToken cancelToken,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    ValidateStatus validateStatus,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final String _path = '/auth/register/confirm';

    final queryParams = <String, dynamic>{};
    final headerParams = <String, dynamic>{
      if (headers != null) ...headers,
    };
    dynamic bodyData;

    queryParams.removeWhere((key, dynamic value) => value == null);
    headerParams.removeWhere((key, dynamic value) => value == null);

    final contentTypes = <String>[
      'application/json',
    ];

    final bodySerializer = _serializers.serializerForType(RegisterConfirmParams)
        as Serializer<RegisterConfirmParams>;
    final serializedBody =
        _serializers.serializeWith(bodySerializer, registerConfirmParams);
    final jsonregisterConfirmParams = json.encode(serializedBody);
    bodyData = jsonregisterConfirmParams;

    return _dio
        .request<dynamic>(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
        headers: headerParams,
        extra: <String, dynamic>{
          'secure': <Map<String, String>>[],
          if (extra != null) ...extra,
        },
        validateStatus: validateStatus,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    )
        .then((response) {
      final serializer = _serializers.serializerForType(RegisterConfirmSuccess)
          as Serializer<RegisterConfirmSuccess>;
      final data = _serializers.deserializeWith<RegisterConfirmSuccess>(
        serializer,
        response.data is String
            ? jsonDecode(response.data as String)
            : response.data,
      );

      return Response<RegisterConfirmSuccess>(
        data: data,
        headers: response.headers,
        requestOptions: response.requestOptions,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }

  /// Регистрация
  ///
  ///
  Future<Response<RegisterSuccess>> authRegisterPost({
    RegisterParams registerParams,
    CancelToken cancelToken,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    ValidateStatus validateStatus,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final String _path = '/auth/register';

    final queryParams = <String, dynamic>{};
    final headerParams = <String, dynamic>{
      if (headers != null) ...headers,
    };
    dynamic bodyData;

    queryParams.removeWhere((key, dynamic value) => value == null);
    headerParams.removeWhere((key, dynamic value) => value == null);

    final contentTypes = <String>[
      'application/json',
    ];

    final bodySerializer = _serializers.serializerForType(RegisterParams)
        as Serializer<RegisterParams>;
    final serializedBody =
        _serializers.serializeWith(bodySerializer, registerParams);
    final jsonregisterParams = json.encode(serializedBody);
    bodyData = jsonregisterParams;

    return _dio
        .request<dynamic>(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
        headers: headerParams,
        extra: <String, dynamic>{
          'secure': <Map<String, String>>[],
          if (extra != null) ...extra,
        },
        validateStatus: validateStatus,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    )
        .then((response) {
      final serializer = _serializers.serializerForType(RegisterSuccess)
          as Serializer<RegisterSuccess>;
      final data = _serializers.deserializeWith<RegisterSuccess>(
        serializer,
        response.data is String
            ? jsonDecode(response.data as String)
            : response.data,
      );

      return Response<RegisterSuccess>(
        data: data,
        headers: response.headers,
        requestOptions: response.requestOptions,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }
}
