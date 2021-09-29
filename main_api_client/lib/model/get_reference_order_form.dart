//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/required_success.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_reference_order_form.g.dart';

abstract class GetReferenceOrderForm
    implements Built<GetReferenceOrderForm, GetReferenceOrderFormBuilder> {
  @nullable
  @BuiltValueField(wireName: r'data')
  JsonObject get data;

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
  GetReferenceOrderForm._();

  static void _initializeBuilder(GetReferenceOrderFormBuilder b) => b
    ..success = true
    ..host = 'https://example.com'
    ..version = '1.0.0'
    ..status = 200;

  factory GetReferenceOrderForm(
      [void updates(GetReferenceOrderFormBuilder b)]) = _$GetReferenceOrderForm;
  static Serializer<GetReferenceOrderForm> get serializer =>
      _$getReferenceOrderFormSerializer;
}
