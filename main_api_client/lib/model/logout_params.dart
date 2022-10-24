//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'logout_params.g.dart';

abstract class LogoutParams
    implements Built<LogoutParams, LogoutParamsBuilder> {
  @nullable
  @BuiltValueField(wireName: r'token')
  String get token;

  // Boilerplate code needed to wire-up generated code
  LogoutParams._();

  static void _initializeBuilder(LogoutParamsBuilder b) => b;

  factory LogoutParams([void updates(LogoutParamsBuilder b)]) = _$LogoutParams;
  static Serializer<LogoutParams> get serializer => _$logoutParamsSerializer;
}
