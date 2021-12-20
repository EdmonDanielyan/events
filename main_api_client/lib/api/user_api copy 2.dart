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

import 'package:main_api_client/model/send_feedback_fail.dart';
import 'package:main_api_client/model/order_dms_fail.dart';
import 'package:main_api_client/model/order_reference_fail.dart';
import 'package:main_api_client/model/movements_fail.dart';
import 'package:main_api_client/model/reference_auto_fill.dart';
import 'package:main_api_client/model/order_dms_success.dart';
import 'package:main_api_client/model/can_inquire.dart';
import 'package:main_api_client/model/get_pub_key_success.dart';
import 'package:main_api_client/model/order_transport_fail.dart';
import 'package:main_api_client/model/get_reference_order_form.dart';
import 'package:main_api_client/model/movements_success.dart';
import 'package:main_api_client/model/get_user_fail.dart';
import 'package:main_api_client/model/get_transport_order_form.dart';
import 'package:main_api_client/model/get_keys_success.dart';
import 'package:main_api_client/model/feedback_tags_list.dart';
import 'package:main_api_client/model/order_dms.dart';
import 'package:main_api_client/model/birthdays_success.dart';
import 'package:main_api_client/model/order_reference_success.dart';
import 'package:main_api_client/model/send_feedback_success.dart';
import 'package:main_api_client/model/birthdays_not_found.dart';
import 'package:main_api_client/model/get_user_success.dart';
import 'package:main_api_client/model/questions_list.dart';
import 'package:main_api_client/model/order_transport_success.dart';
import 'dart:typed_data';
import 'package:built_collection/built_collection.dart';
import 'package:main_api_client/api_util.dart';

class UserApi {
  final Dio _dio;
  Serializers _serializers;

  UserApi(this._dio, this._serializers);

  /// Получение ключей шифрования текущего пользователя
  ///
  ///
  Future<Response<GetKeysSuccess>> keysGet({
    CancelToken cancelToken,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    ValidateStatus validateStatus,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final String _path = '/keys';

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
      final serializer = _serializers.serializerForType(GetKeysSuccess)
          as Serializer<GetKeysSuccess>;
      final data = _serializers.deserializeWith<GetKeysSuccess>(
        serializer,
        response.data is String
            ? jsonDecode(response.data as String)
            : response.data,
      );

      return Response<GetKeysSuccess>(
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

  /// Получение публичного ключа другого пользователя
  ///
  ///
  Future<Response<GetPubKeySuccess>> keysIdGet(
    int id, {
    CancelToken cancelToken,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    ValidateStatus validateStatus,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final String _path = '/keys/{id}'.replaceAll('{' r'id' '}', id.toString());

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
      final serializer = _serializers.serializerForType(GetPubKeySuccess)
          as Serializer<GetPubKeySuccess>;
      final data = _serializers.deserializeWith<GetPubKeySuccess>(
        serializer,
        response.data is String
            ? jsonDecode(response.data as String)
            : response.data,
      );

      return Response<GetPubKeySuccess>(
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

  /// Возвращает тэги для формы обратной связи
  ///
  ///
  Future<Response<FeedbackTagsList>> userGetfeedbacktagsGet({
    CancelToken cancelToken,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    ValidateStatus validateStatus,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final String _path = '/user/getfeedbacktags';

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
      final serializer = _serializers.serializerForType(FeedbackTagsList)
          as Serializer<FeedbackTagsList>;
      final data = _serializers.deserializeWith<FeedbackTagsList>(
        serializer,
        response.data is String
            ? jsonDecode(response.data as String)
            : response.data,
      );

      return Response<FeedbackTagsList>(
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

  /// Возвращает вопросы (обратная связь)
  ///
  ///
  Future<Response<QuestionsList>> userGetquestionsGet({
    int pageNumber,
    int countOnPage,
    CancelToken cancelToken,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    ValidateStatus validateStatus,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final String _path = '/user/getquestions';

    final queryParams = <String, dynamic>{};
    final headerParams = <String, dynamic>{
      if (headers != null) ...headers,
    };
    dynamic bodyData;

    queryParams[r'page_number'] = pageNumber;
    queryParams[r'count_on_page'] = countOnPage;
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
      final serializer = _serializers.serializerForType(QuestionsList)
          as Serializer<QuestionsList>;
      final data = _serializers.deserializeWith<QuestionsList>(
        serializer,
        response.data is String
            ? jsonDecode(response.data as String)
            : response.data,
      );

      return Response<QuestionsList>(
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

  /// Автозаполняемые поля для формы справок
  ///
  ///
  Future<Response<ReferenceAutoFill>> userGetreferenceautofillGet({
    CancelToken cancelToken,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    ValidateStatus validateStatus,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final String _path = '/user/getreferenceautofill';

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
      final serializer = _serializers.serializerForType(ReferenceAutoFill)
          as Serializer<ReferenceAutoFill>;
      final data = _serializers.deserializeWith<ReferenceAutoFill>(
        serializer,
        response.data is String
            ? jsonDecode(response.data as String)
            : response.data,
      );

      return Response<ReferenceAutoFill>(
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

  /// Метод для заказа ДМС
  ///
  ///
  Future<Response<OrderDMSSuccess>> userOrderdmsPost({
    OrderDMS orderDMS,
    CancelToken cancelToken,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    ValidateStatus validateStatus,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final String _path = '/user/orderdms';

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
        _serializers.serializerForType(OrderDMS) as Serializer<OrderDMS>;
    final serializedBody = _serializers.serializeWith(bodySerializer, orderDMS);
    final jsonorderDMS = json.encode(serializedBody);
    bodyData = jsonorderDMS;

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
      final serializer = _serializers.serializerForType(OrderDMSSuccess)
          as Serializer<OrderDMSSuccess>;
      final data = _serializers.deserializeWith<OrderDMSSuccess>(
        serializer,
        response.data is String
            ? jsonDecode(response.data as String)
            : response.data,
      );

      return Response<OrderDMSSuccess>(
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
  Future<Response<OrderReferenceSuccess>> userOrderreferencePost(
    String referenceType,
    String phone,
    String way, {
    String postalCode,
    String address,
    String period,
    String destination,
    int num_,
    String child,
    String dateStart,
    String dateEnd,
    List<MultipartFile> filesLeftSquareBracketRightSquareBracket,
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
      'multipart/form-data',
    ];

    final formData = <String, dynamic>{
      r'reference_type': parameterToString(_serializers, referenceType),
      r'phone': parameterToString(_serializers, phone),
      r'way': parameterToString(_serializers, way),
      if (postalCode != null)
        r'postal_code': parameterToString(_serializers, postalCode),
      if (address != null) r'address': parameterToString(_serializers, address),
      if (period != null) r'period': parameterToString(_serializers, period),
      if (destination != null)
        r'destination': parameterToString(_serializers, destination),
      if (num_ != null) r'num': parameterToString(_serializers, num_),
      if (child != null) r'child': parameterToString(_serializers, child),
      if (dateStart != null)
        r'date_start': parameterToString(_serializers, dateStart),
      if (dateEnd != null)
        r'date_end': parameterToString(_serializers, dateEnd),
      if (filesLeftSquareBracketRightSquareBracket != null &&
          filesLeftSquareBracketRightSquareBracket.isNotEmpty)
        r'files[]': filesLeftSquareBracketRightSquareBracket,
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
    List<MultipartFile> filesLeftSquareBracketRightSquareBracket,
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
      if (filesLeftSquareBracketRightSquareBracket != null &&
          filesLeftSquareBracketRightSquareBracket.isNotEmpty)
        r'files[]': filesLeftSquareBracketRightSquareBracket,
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
  Future<Response<GetReferenceOrderForm>> userReferenceorderformGet({
    CancelToken cancelToken,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    ValidateStatus validateStatus,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final String _path = '/user/referenceorderform';

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
      final serializer = _serializers.serializerForType(GetReferenceOrderForm)
          as Serializer<GetReferenceOrderForm>;
      final data = _serializers.deserializeWith<GetReferenceOrderForm>(
        serializer,
        response.data is String
            ? jsonDecode(response.data as String)
            : response.data,
      );

      return Response<GetReferenceOrderForm>(
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

  /// Метод для отправки обратной связи (вопроса руководству)
  ///
  ///
  Future<Response<SendFeedbackSuccess>> userSendfeedbackPost(
    String question,
    String tags, {
    String fio,
    String contacts,
    List<MultipartFile> filesLeftSquareBracketRightSquareBracket,
    CancelToken cancelToken,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    ValidateStatus validateStatus,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final String _path = '/user/sendfeedback';

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

    final formData = <String, dynamic>{
      if (fio != null) r'fio': parameterToString(_serializers, fio),
      if (contacts != null)
        r'contacts': parameterToString(_serializers, contacts),
      r'question': parameterToString(_serializers, question),
      r'tags': parameterToString(_serializers, tags),
      if (filesLeftSquareBracketRightSquareBracket != null &&
          filesLeftSquareBracketRightSquareBracket.isNotEmpty)
        r'files[]': filesLeftSquareBracketRightSquareBracket,
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
      final serializer = _serializers.serializerForType(SendFeedbackSuccess)
          as Serializer<SendFeedbackSuccess>;
      final data = _serializers.deserializeWith<SendFeedbackSuccess>(
        serializer,
        response.data is String
            ? jsonDecode(response.data as String)
            : response.data,
      );

      return Response<SendFeedbackSuccess>(
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
