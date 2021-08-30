//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/required_error.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'bad_request.g.dart';

abstract class BadRequest implements Built<BadRequest, BadRequestBuilder> {
  @nullable
  @BuiltValueField(wireName: r'status')
  int get status;

  @nullable
  @BuiltValueField(wireName: r'code')
  String get code;

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
  @BuiltValueField(wireName: r'type')
  String get type;

  @nullable
  @BuiltValueField(wireName: r'instance')
  String get instance;

  // Boilerplate code needed to wire-up generated code
  BadRequest._();

  static void _initializeBuilder(BadRequestBuilder b) => b
    ..status = 400
    ..code = 'QMA-#'
    ..success = false
    ..host = 'https://example.com'
    ..type = 'about:blank';

  factory BadRequest([void updates(BadRequestBuilder b)]) = _$BadRequest;
  static Serializer<BadRequest> get serializer => _$badRequestSerializer;
}
