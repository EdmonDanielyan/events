//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'auth_params.g.dart';

abstract class AuthParams implements Built<AuthParams, AuthParamsBuilder> {
  /// Логин пользователя
  @nullable
  @BuiltValueField(wireName: r'login')
  String get login;

  /// Пароль пользователя
  @nullable
  @BuiltValueField(wireName: r'password')
  String get password;

  // Boilerplate code needed to wire-up generated code
  AuthParams._();

  static void _initializeBuilder(AuthParamsBuilder b) => b;

  factory AuthParams([void updates(AuthParamsBuilder b)]) = _$AuthParams;
  static Serializer<AuthParams> get serializer => _$authParamsSerializer;
}
