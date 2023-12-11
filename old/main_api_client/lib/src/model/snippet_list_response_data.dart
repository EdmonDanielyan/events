//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/snippet.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'snippet_list_response_data.g.dart';

/// SnippetListResponseData
///
/// Properties:
/// * [snippets] 
@BuiltValue()
abstract class SnippetListResponseData implements Built<SnippetListResponseData, SnippetListResponseDataBuilder> {
  @BuiltValueField(wireName: r'snippets')
  BuiltList<Snippet>? get snippets;

  SnippetListResponseData._();

  factory SnippetListResponseData([void updates(SnippetListResponseDataBuilder b)]) = _$SnippetListResponseData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SnippetListResponseDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SnippetListResponseData> get serializer => _$SnippetListResponseDataSerializer();
}

class _$SnippetListResponseDataSerializer implements PrimitiveSerializer<SnippetListResponseData> {
  @override
  final Iterable<Type> types = const [SnippetListResponseData, _$SnippetListResponseData];

  @override
  final String wireName = r'SnippetListResponseData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SnippetListResponseData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.snippets != null) {
      yield r'snippets';
      yield serializers.serialize(
        object.snippets,
        specifiedType: const FullType(BuiltList, [FullType(Snippet)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SnippetListResponseData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SnippetListResponseDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'snippets':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Snippet)]),
          ) as BuiltList<Snippet>;
          result.snippets.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SnippetListResponseData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SnippetListResponseDataBuilder();
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

