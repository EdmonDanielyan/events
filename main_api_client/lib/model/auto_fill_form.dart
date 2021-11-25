//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'auto_fill_form.g.dart';

abstract class AutoFillForm
    implements Built<AutoFillForm, AutoFillFormBuilder> {
  @nullable
  @BuiltValueField(wireName: r'fio')
  String get fio;

  @nullable
  @BuiltValueField(wireName: r'position')
  String get position;

  @nullable
  @BuiltValueField(wireName: r'department')
  String get department;

  @nullable
  @BuiltValueField(wireName: r'email')
  String get email;

  // Boilerplate code needed to wire-up generated code
  AutoFillForm._();

  static void _initializeBuilder(AutoFillFormBuilder b) => b;

  factory AutoFillForm([void updates(AutoFillFormBuilder b)]) = _$AutoFillForm;
  static Serializer<AutoFillForm> get serializer => _$autoFillFormSerializer;
}
