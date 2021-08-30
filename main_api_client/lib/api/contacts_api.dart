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

import 'package:main_api_client/model/get_contacts.dart';
import 'package:main_api_client/model/contacts_not_found.dart';

class ContactsApi {
  final Dio _dio;
  Serializers _serializers;

  ContactsApi(this._dio, this._serializers);

  /// Получение контактов
  ///
  /// Получение контактов (пользователей) в поиске мессенджера по введенной строке. Совпадение проверяется по ФИО без учета ошибок.
  Future<Response<GetContacts>> getContacts({
    String search,
    int pageNumber,
    int countOnPage,
    CancelToken cancelToken,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    ValidateStatus validateStatus,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final String _path = '/contacts';

    final queryParams = <String, dynamic>{};
    final headerParams = <String, dynamic>{
      if (headers != null) ...headers,
    };
    dynamic bodyData;

    queryParams[r'search'] = search;
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
      final serializer = _serializers.serializerForType(GetContacts)
          as Serializer<GetContacts>;
      final data = _serializers.deserializeWith<GetContacts>(
        serializer,
        response.data is String
            ? jsonDecode(response.data as String)
            : response.data,
      );

      return Response<GetContacts>(
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
