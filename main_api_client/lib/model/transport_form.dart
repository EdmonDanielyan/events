//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'transport_form.g.dart';

abstract class TransportForm
    implements Built<TransportForm, TransportFormBuilder> {
  @nullable
  @BuiltValueField(wireName: r'ID')
  int get ID;

  @nullable
  @BuiltValueField(wireName: r'title')
  String get title;

  // Boilerplate code needed to wire-up generated code
  TransportForm._();

  static void _initializeBuilder(TransportFormBuilder b) => b;

  factory TransportForm([void updates(TransportFormBuilder b)]) =
      _$TransportForm;
  static Serializer<TransportForm> get serializer => _$transportFormSerializer;
}
