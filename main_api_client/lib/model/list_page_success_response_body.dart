//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/list_page_success_response_body_all_of.dart';
import 'package:main_api_client/model/required_success.dart';
import 'package:main_api_client/model/list_page_response_data.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'list_page_success_response_body.g.dart';

abstract class ListPageSuccessResponseBody
    implements
        Built<ListPageSuccessResponseBody, ListPageSuccessResponseBodyBuilder> {
  @nullable
  @BuiltValueField(wireName: r'success')
  bool get success;

  @nullable
  @BuiltValueField(wireName: r'host')
  String get host;

  @nullable
  @BuiltValueField(wireName: r'version')
  String get version;

  @nullable
  @BuiltValueField(wireName: r'returned')
  DateTime get returned;

  @nullable
  @BuiltValueField(wireName: r'status')
  int get status;

  @nullable
  @BuiltValueField(wireName: r'data')
  ListPageResponseData get data;

  // Boilerplate code needed to wire-up generated code
  ListPageSuccessResponseBody._();

  static void _initializeBuilder(ListPageSuccessResponseBodyBuilder b) => b
    ..success = true
    ..host = 'https://example.com'
    ..version = '1.0.0'
    ..status = 200;

  factory ListPageSuccessResponseBody(
          [void updates(ListPageSuccessResponseBodyBuilder b)]) =
      _$ListPageSuccessResponseBody;
  static Serializer<ListPageSuccessResponseBody> get serializer =>
      _$listPageSuccessResponseBodySerializer;
}
