//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/required_error.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'forbidden.g.dart';

abstract class Forbidden implements Built<Forbidden, ForbiddenBuilder> {
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
  Forbidden._();

  static void _initializeBuilder(ForbiddenBuilder b) => b
    ..status = 403
    ..code = 'QMA-#'
    ..success = false
    ..host = 'https://example.com'
    ..type = 'about:blank';

  factory Forbidden([void updates(ForbiddenBuilder b)]) = _$Forbidden;
  static Serializer<Forbidden> get serializer => _$forbiddenSerializer;
}
