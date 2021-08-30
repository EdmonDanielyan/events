//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/required_success.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_confirm_success.g.dart';

abstract class RegisterConfirmSuccess
    implements Built<RegisterConfirmSuccess, RegisterConfirmSuccessBuilder> {
  @nullable
  @BuiltValueField(wireName: r'status')
  int get status;

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

  // Boilerplate code needed to wire-up generated code
  RegisterConfirmSuccess._();

  static void _initializeBuilder(RegisterConfirmSuccessBuilder b) => b
    ..status = 200
    ..success = true
    ..host = 'https://example.com'
    ..version = '1.0.0';

  factory RegisterConfirmSuccess(
          [void updates(RegisterConfirmSuccessBuilder b)]) =
      _$RegisterConfirmSuccess;
  static Serializer<RegisterConfirmSuccess> get serializer =>
      _$registerConfirmSuccessSerializer;
}
