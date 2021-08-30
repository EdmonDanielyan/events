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

import 'package:main_api_client/model/order_reference_fail.dart';
import 'package:main_api_client/model/movements_fail.dart';
import 'package:main_api_client/model/order_reference.dart';
import 'package:main_api_client/model/can_inquire.dart';
import 'package:main_api_client/model/order_transport_fail.dart';
import 'package:main_api_client/model/movements_success.dart';
import 'package:main_api_client/model/get_user_fail.dart';
import 'package:main_api_client/model/get_transport_order_form.dart';
import 'package:main_api_client/model/birthdays_success.dart';
import 'package:main_api_client/model/order_reference_success.dart';
import 'package:main_api_client/model/birthdays_not_found.dart';
import 'package:main_api_client/model/get_user_success.dart';
import 'package:main_api_client/model/order_transport_success.dart';
import 'dart:typed_data';
import 'package:built_collection/built_collection.dart';
import 'package:main_api_client/api_util.dart';

class UserApi {
  final Dio _dio;
  Serializers _serializers;

  UserApi(this._dio, this._serializers);

  ///
  ///
  ///
  Future<Response<BirthdaysSuccess>> userBirthdayGet({
    CancelToken cancelToken,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    ValidateStatus validateStatus,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final String _path = '/user/birthday';

    final queryParams = <String, dynamic>{};
    final headerParams = <String, dynamic>{
      if (headers != null) ...headers,
    };
    dynamic bodyData;

    queryParams.removeWhere((key, dynamic value) => value == null);
    headerParams.removeWhere((key, dynamic value) => value == null);

    final contentTypes = <String>[];

    return _dio
        .request<dynamic>(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'get'.toUpperCase(),
        headers: headerParams,
        extra: <String, dynamic>{
          'secure': <Map<String, String>>[
            {
              'type': 'http',
              'name': 'bearerAuth',
            },
          ],
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
      final serializer = _serializers.serializerForType(BirthdaysSuccess)
          as Serializer<BirthdaysSuccess>;
      final data = _serializers.deserializeWith<BirthdaysSuccess>(
        serializer,
        response.data is String
            ? jsonDecode(response.data as String)
            : response.data,
      );

      return Response<BirthdaysSuccess>(
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

  /// Метод для получения информации может ли пользователь оставлять заявки на справки
  ///
  ///
  Future<Response<CanInquire>> userCaninquireGet({
    CancelToken cancelToken,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    ValidateStatus validateStatus,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final String _path = '/user/caninquire';

    final queryParams = <String, dynamic>{};
    final headerParams = <String, dynamic>{
      if (headers != null) ...headers,
    };
    dynamic bodyData;

    queryParams.removeWhere((key, dynamic value) => value == null);
    headerParams.removeWhere((key, dynamic value) => value == null);

    final contentTypes = <String>[];

    return _dio
        .request<dynamic>(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'get'.toUpperCase(),
        headers: headerParams,
        extra: <String, dynamic>{
          'secure': <Map<String, String>>[
            {
              'type': 'http',
              'name': 'bearerAuth',
            },
          ],
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
      final serializer =
          _serializers.serializerForType(CanInquire) as Serializer<CanInquire>;
      final data = _serializers.deserializeWith<CanInquire>(
        serializer,
        response.data is String
            ? jsonDecode(response.data as String)
            : response.data,
      );

      return Response<CanInquire>(
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

  /// Получение информации о текущем пользователе
  ///
  ///
  Future<Response<GetUserSuccess>> userGet({
    CancelToken cancelToken,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    ValidateStatus validateStatus,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final String _path = '/user';

    final queryParams = <String, dynamic>{};
    final headerParams = <String, dynamic>{
      if (headers != null) ...headers,
    };
    dynamic bodyData;

    queryParams.removeWhere((key, dynamic value) => value == null);
    headerParams.removeWhere((key, dynamic value) => value == null);

    final contentTypes = <String>[];

    return _dio
        .request<dynamic>(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'get'.toUpperCase(),
        headers: headerParams,
        extra: <String, dynamic>{
          'secure': <Map<String, String>>[
            {
              'type': 'http',
              'name': 'bearerAuth',
            },
          ],
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
      final serializer = _serializers.serializerForType(GetUserSuccess)
          as Serializer<GetUserSuccess>;
      final data = _serializers.deserializeWith<GetUserSuccess>(
        serializer,
        response.data is String
            ? jsonDecode(response.data as String)
            : response.data,
      );

      return Response<GetUserSuccess>(
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

  /// Получение информации о пользователе по ID
  ///
  ///
  Future<Response<GetUserSuccess>> userIdGet(
    int id, {
    CancelToken cancelToken,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    ValidateStatus validateStatus,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final String _path = '/user/{id}'.replaceAll('{' r'id' '}', id.toString());

    final queryParams = <String, dynamic>{};
    final headerParams = <String, dynamic>{
      if (headers != null) ...headers,
    };
    dynamic bodyData;

    queryParams.removeWhere((key, dynamic value) => value == null);
    headerParams.removeWhere((key, dynamic value) => value == null);

    final contentTypes = <String>[];

    return _dio
        .request<dynamic>(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'get'.toUpperCase(),
        headers: headerParams,
        extra: <String, dynamic>{
          'secure': <Map<String, String>>[
            {
              'type': 'http',
              'name': 'bearerAuth',
            },
          ],
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
      final serializer = _serializers.serializerForType(GetUserSuccess)
          as Serializer<GetUserSuccess>;
      final data = _serializers.deserializeWith<GetUserSuccess>(
        serializer,
        response.data is String
            ? jsonDecode(response.data as String)
            : response.data,
      );

      return Response<GetUserSuccess>(
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

  /// Получение информации о кадровых перемещениях текущего пользователя
  ///
  ///
  Future<Response<MovementsSuccess>> userMovementsGet({
    CancelToken cancelToken,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    ValidateStatus validateStatus,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final String _path = '/user/movements';

    final queryParams = <String, dynamic>{};
    final headerParams = <String, dynamic>{
      if (headers != null) ...headers,
    };
    dynamic bodyData;

    queryParams.removeWhere((key, dynamic value) => value == null);
    headerParams.removeWhere((key, dynamic value) => value == null);

    final contentTypes = <String>[];

    return _dio
        .request<dynamic>(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'get'.toUpperCase(),
        headers: headerParams,
        extra: <String, dynamic>{
          'secure': <Map<String, String>>[
            {
              'type': 'http',
              'name': 'bearerAuth',
            },
          ],
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
      final serializer = _serializers.serializerForType(MovementsSuccess)
          as Serializer<MovementsSuccess>;
      final data = _serializers.deserializeWith<MovementsSuccess>(
        serializer,
        response.data is String
            ? jsonDecode(response.data as String)
            : response.data,
      );

      return Response<MovementsSuccess>(
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

  /// Метод для заказа справок
  ///
  ///
  Future<Response<OrderReferenceSuccess>> userOrderreferencePost({
    OrderReference orderReference,
    CancelToken cancelToken,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    ValidateStatus validateStatus,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final String _path = '/user/orderreference';

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

    final bodySerializer = _serializers.serializerForType(OrderReference)
        as Serializer<OrderReference>;
    final serializedBody =
        _serializers.serializeWith(bodySerializer, orderReference);
    final jsonorderReference = json.encode(serializedBody);
    bodyData = jsonorderReference;

    return _dio
        .request<dynamic>(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
        headers: headerParams,
        extra: <String, dynamic>{
          'secure': <Map<String, String>>[
            {
              'type': 'http',
              'name': 'bearerAuth',
            },
          ],
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
      final serializer = _serializers.serializerForType(OrderReferenceSuccess)
          as Serializer<OrderReferenceSuccess>;
      final data = _serializers.deserializeWith<OrderReferenceSuccess>(
        serializer,
        response.data is String
            ? jsonDecode(response.data as String)
            : response.data,
      );

      return Response<OrderReferenceSuccess>(
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

  /// Метод для заказа транспорта
  ///
  ///
  Future<Response<OrderTransportSuccess>> userOrdertransportPost(
    String fio,
    String phone,
    int status,
    String date,
    String time,
    String place,
    String howLong,
    String passengers,
    String route, {
    BuiltList<Uint8List> filesLeftSquareBracketRightSquareBracket,
    CancelToken cancelToken,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    ValidateStatus validateStatus,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final String _path = '/user/ordertransport';

    final queryParams = <String, dynamic>{};
    final headerParams = <String, dynamic>{
      if (headers != null) ...headers,
    };
    dynamic bodyData;

    queryParams.removeWhere((key, dynamic value) => value == null);
    headerParams.removeWhere((key, dynamic value) => value == null);

    final contentTypes = <String>[
      'multipart/form-data',
    ];

    List<MultipartFile> filesArray;
    int count = 0;

    filesLeftSquareBracketRightSquareBracket.forEach((value) {
      count++;
      filesArray.add(
          MultipartFile.fromBytes(
              value,
              filename: 'files[' + count.toString() + ']'
          )
      );
    });

    final formData = <String, dynamic>{
      r'fio': parameterToString(_serializers, fio),
      r'phone': parameterToString(_serializers, phone),
      r'status': parameterToString(_serializers, status),
      r'date': parameterToString(_serializers, date),
      r'time': parameterToString(_serializers, time),
      r'place': parameterToString(_serializers, place),
      r'how_long': parameterToString(_serializers, howLong),
      r'passengers': parameterToString(_serializers, passengers),
      r'route': parameterToString(_serializers, route),
      if (filesArray.isNotEmpty)
        r'files[]': filesArray
    };
    bodyData = FormData.fromMap(formData);

    return _dio
        .request<dynamic>(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
        headers: headerParams,
        extra: <String, dynamic>{
          'secure': <Map<String, String>>[
            {
              'type': 'http',
              'name': 'bearerAuth',
            },
          ],
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
      final serializer = _serializers.serializerForType(OrderTransportSuccess)
          as Serializer<OrderTransportSuccess>;
      final data = _serializers.deserializeWith<OrderTransportSuccess>(
        serializer,
        response.data is String
            ? jsonDecode(response.data as String)
            : response.data,
      );

      return Response<OrderTransportSuccess>(
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

  /// Возвращает вспомогательные данные для формы заказа транспорта
  ///
  ///
  Future<Response<GetTransportOrderForm>> userTranspontorderformGet({
    CancelToken cancelToken,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    ValidateStatus validateStatus,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final String _path = '/user/transpontorderform';

    final queryParams = <String, dynamic>{};
    final headerParams = <String, dynamic>{
      if (headers != null) ...headers,
    };
    dynamic bodyData;

    queryParams.removeWhere((key, dynamic value) => value == null);
    headerParams.removeWhere((key, dynamic value) => value == null);

    final contentTypes = <String>[];

    return _dio
        .request<dynamic>(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'get'.toUpperCase(),
        headers: headerParams,
        extra: <String, dynamic>{
          'secure': <Map<String, String>>[
            {
              'type': 'http',
              'name': 'bearerAuth',
            },
          ],
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
      final serializer = _serializers.serializerForType(GetTransportOrderForm)
          as Serializer<GetTransportOrderForm>;
      final data = _serializers.deserializeWith<GetTransportOrderForm>(
        serializer,
        response.data is String
            ? jsonDecode(response.data as String)
            : response.data,
      );

      return Response<GetTransportOrderForm>(
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
