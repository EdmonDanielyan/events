//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'required_success.g.dart';

abstract class RequiredSuccess
    implements Built<RequiredSuccess, RequiredSuccessBuilder> {
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

  // Boilerplate code needed to wire-up generated code
  RequiredSuccess._();

  static void _initializeBuilder(RequiredSuccessBuilder b) => b
    ..success = true
    ..host = 'https://example.com'
    ..version = '1.0.0'
    ..status = 200;

  factory RequiredSuccess([void updates(RequiredSuccessBuilder b)]) =
      _$RequiredSuccess;
  static Serializer<RequiredSuccess> get serializer =>
      _$requiredSuccessSerializer;
}
