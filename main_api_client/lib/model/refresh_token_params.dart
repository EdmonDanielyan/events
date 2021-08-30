//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'refresh_token_params.g.dart';

abstract class RefreshTokenParams
    implements Built<RefreshTokenParams, RefreshTokenParamsBuilder> {
  @nullable
  @BuiltValueField(wireName: r'token')
  String get token;

  // Boilerplate code needed to wire-up generated code
  RefreshTokenParams._();

  static void _initializeBuilder(RefreshTokenParamsBuilder b) => b;

  factory RefreshTokenParams([void updates(RefreshTokenParamsBuilder b)]) =
      _$RefreshTokenParams;
  static Serializer<RefreshTokenParams> get serializer =>
      _$refreshTokenParamsSerializer;
}
