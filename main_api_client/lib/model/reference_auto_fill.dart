//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/auto_fill_form.dart';
import 'package:main_api_client/model/required_success.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'reference_auto_fill.g.dart';

abstract class ReferenceAutoFill
    implements Built<ReferenceAutoFill, ReferenceAutoFillBuilder> {
  @nullable
  @BuiltValueField(wireName: r'data')
  AutoFillForm get data;

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
  ReferenceAutoFill._();

  static void _initializeBuilder(ReferenceAutoFillBuilder b) => b
    ..success = true
    ..host = 'https://example.com'
    ..version = '1.0.0'
    ..status = 200;

  factory ReferenceAutoFill([void updates(ReferenceAutoFillBuilder b)]) =
      _$ReferenceAutoFill;
  static Serializer<ReferenceAutoFill> get serializer =>
      _$referenceAutoFillSerializer;
}
