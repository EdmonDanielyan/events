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

import 'package:main_api_client/model/get_announcement_by_id.dart';
import 'package:main_api_client/model/announcements_not_found.dart';
import 'package:main_api_client/model/get_announcements.dart';
import 'package:main_api_client/model/bad_id.dart';

class AnnouncementsApi {
  final Dio _dio;
  Serializers _serializers;

  AnnouncementsApi(this._dio, this._serializers);

  /// Получить информацию об объявлении по ID
  ///
  /// Получить информацию о конкретном объявлении по ID
  Future<Response<GetAnnouncementById>> getAnnouncementById(
    int id, {
    CancelToken cancelToken,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    ValidateStatus validateStatus,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final String _path =
        '/announcements/{id}'.replaceAll('{' r'id' '}', id.toString());

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
      final serializer = _serializers.serializerForType(GetAnnouncementById)
          as Serializer<GetAnnouncementById>;
      final data = _serializers.deserializeWith<GetAnnouncementById>(
        serializer,
        response.data is String
            ? jsonDecode(response.data as String)
            : response.data,
      );

      return Response<GetAnnouncementById>(
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

  /// Получение списка событий
  ///
  /// Получение списка событий по убыванию даты создания с пагинацией
  Future<Response<GetAnnouncements>> getAnnouncements({
    int pageNumber,
    int countOnPage,
    CancelToken cancelToken,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    ValidateStatus validateStatus,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final String _path = '/announcements';

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
      final serializer = _serializers.serializerForType(GetAnnouncements)
          as Serializer<GetAnnouncements>;
      final data = _serializers.deserializeWith<GetAnnouncements>(
        serializer,
        response.data is String
            ? jsonDecode(response.data as String)
            : response.data,
      );

      return Response<GetAnnouncements>(
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
