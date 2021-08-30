//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_confirm_params.g.dart';

abstract class RegisterConfirmParams
    implements Built<RegisterConfirmParams, RegisterConfirmParamsBuilder> {
  /// Номер телефона пользователя указанный при регистрации
  @nullable
  @BuiltValueField(wireName: r'phone')
  String get phone;

  /// Код подтверждения
  @nullable
  @BuiltValueField(wireName: r'code')
  int get code;

  // Boilerplate code needed to wire-up generated code
  RegisterConfirmParams._();

  static void _initializeBuilder(RegisterConfirmParamsBuilder b) => b;

  factory RegisterConfirmParams(
      [void updates(RegisterConfirmParamsBuilder b)]) = _$RegisterConfirmParams;
  static Serializer<RegisterConfirmParams> get serializer =>
      _$registerConfirmParamsSerializer;
}
