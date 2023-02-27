//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'snippet.g.dart';

abstract class Snippet implements Built<Snippet, SnippetBuilder> {
  /// Тип строки, простой текст или html.
  @nullable
  @BuiltValueField(wireName: r'type')
  SnippetTypeEnum get type;
  // enum typeEnum {  text,  html,  };

  @nullable
  @BuiltValueField(wireName: r'code')
  String get code;

  @nullable
  @BuiltValueField(wireName: r'text')
  String get text;

  // Boilerplate code needed to wire-up generated code
  Snippet._();

  static void _initializeBuilder(SnippetBuilder b) => b;

  factory Snippet([void updates(SnippetBuilder b)]) = _$Snippet;
  static Serializer<Snippet> get serializer => _$snippetSerializer;
}

class SnippetTypeEnum extends EnumClass {
  /// Тип строки, простой текст или html.
  @BuiltValueEnumConst(wireName: r'text')
  static const SnippetTypeEnum text = _$snippetTypeEnum_text;

  /// Тип строки, простой текст или html.
  @BuiltValueEnumConst(wireName: r'html')
  static const SnippetTypeEnum html = _$snippetTypeEnum_html;

  static Serializer<SnippetTypeEnum> get serializer =>
      _$snippetTypeEnumSerializer;

  const SnippetTypeEnum._(String name) : super(name);

  static BuiltSet<SnippetTypeEnum> get values => _$snippetTypeEnumValues;
  static SnippetTypeEnum valueOf(String name) => _$snippetTypeEnumValueOf(name);
}
