//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_params.g.dart';

abstract class RegisterParams
    implements Built<RegisterParams, RegisterParamsBuilder> {
  @nullable
  @BuiltValueField(wireName: r'firstName')
  String get firstName;

  @nullable
  @BuiltValueField(wireName: r'lastName')
  String get lastName;

  @nullable
  @BuiltValueField(wireName: r'secondName')
  String get secondName;

  @nullable
  @BuiltValueField(wireName: r'password')
  String get password;

  @nullable
  @BuiltValueField(wireName: r'tabelNumber')
  int get tabelNumber;

  @nullable
  @BuiltValueField(wireName: r'phone')
  String get phone;

  @nullable
  @BuiltValueField(wireName: r'birthday')
  String get birthday;

  // Boilerplate code needed to wire-up generated code
  RegisterParams._();

  static void _initializeBuilder(RegisterParamsBuilder b) => b;

  factory RegisterParams([void updates(RegisterParamsBuilder b)]) =
      _$RegisterParams;
  static Serializer<RegisterParams> get serializer =>
      _$registerParamsSerializer;
}
