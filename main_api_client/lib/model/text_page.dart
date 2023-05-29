//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'text_page.g.dart';

abstract class TextPage implements Built<TextPage, TextPageBuilder> {
  @nullable
  @BuiltValueField(wireName: r'type')
  String get type;

  @nullable
  @BuiltValueField(wireName: r'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: r'code')
  String get code;

  @nullable
  @BuiltValueField(wireName: r'name')
  String get name;

  @nullable
  @BuiltValueField(wireName: r'preview')
  String get preview;

  @nullable
  @BuiltValueField(wireName: r'detail')
  String get detail;

  @nullable
  @BuiltValueField(wireName: r'iconUrl')
  String get iconUrl;

  // Boilerplate code needed to wire-up generated code
  TextPage._();

  static void _initializeBuilder(TextPageBuilder b) => b;

  factory TextPage([void updates(TextPageBuilder b)]) = _$TextPage;
  static Serializer<TextPage> get serializer => _$textPageSerializer;
}
