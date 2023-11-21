//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'snippet.g.dart';

/// Snippet
///
/// Properties:
/// * [type] - Тип строки, простой текст или html.
/// * [code] 
/// * [text] 
@BuiltValue()
abstract class Snippet implements Built<Snippet, SnippetBuilder> {
  /// Тип строки, простой текст или html.
  @BuiltValueField(wireName: r'type')
  SnippetTypeEnum? get type;
  // enum typeEnum {  text,  html,  };

  @BuiltValueField(wireName: r'code')
  String? get code;

  @BuiltValueField(wireName: r'text')
  String? get text;

  Snippet._();

  factory Snippet([void updates(SnippetBuilder b)]) = _$Snippet;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SnippetBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Snippet> get serializer => _$SnippetSerializer();
}

class _$SnippetSerializer implements PrimitiveSerializer<Snippet> {
  @override
  final Iterable<Type> types = const [Snippet, _$Snippet];

  @override
  final String wireName = r'Snippet';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Snippet object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType(SnippetTypeEnum),
      );
    }
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
        specifiedType: const FullType(String),
      );
    }
    if (object.text != null) {
      yield r'text';
      yield serializers.serialize(
        object.text,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Snippet object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SnippetBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SnippetTypeEnum),
          ) as SnippetTypeEnum;
          result.type = valueDes;
          break;
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        case r'text':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.text = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Snippet deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SnippetBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

class SnippetTypeEnum extends EnumClass {

  /// Тип строки, простой текст или html.
  @BuiltValueEnumConst(wireName: r'text')
  static const SnippetTypeEnum text = _$snippetTypeEnum_text;
  /// Тип строки, простой текст или html.
  @BuiltValueEnumConst(wireName: r'html')
  static const SnippetTypeEnum html = _$snippetTypeEnum_html;

  static Serializer<SnippetTypeEnum> get serializer => _$snippetTypeEnumSerializer;

  const SnippetTypeEnum._(String name): super(name);

  static BuiltSet<SnippetTypeEnum> get values => _$snippetTypeEnumValues;
  static SnippetTypeEnum valueOf(String name) => _$snippetTypeEnumValueOf(name);
}

