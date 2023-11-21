//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/snippet_list_response_data.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'list_snippet_success_response_body_all_of.g.dart';

/// ListSnippetSuccessResponseBodyAllOf
///
/// Properties:
/// * [data] 
@BuiltValue(instantiable: false)
abstract class ListSnippetSuccessResponseBodyAllOf  {
  @BuiltValueField(wireName: r'data')
  SnippetListResponseData? get data;

  @BuiltValueSerializer(custom: true)
  static Serializer<ListSnippetSuccessResponseBodyAllOf> get serializer => _$ListSnippetSuccessResponseBodyAllOfSerializer();
}

class _$ListSnippetSuccessResponseBodyAllOfSerializer implements PrimitiveSerializer<ListSnippetSuccessResponseBodyAllOf> {
  @override
  final Iterable<Type> types = const [ListSnippetSuccessResponseBodyAllOf];

  @override
  final String wireName = r'ListSnippetSuccessResponseBodyAllOf';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ListSnippetSuccessResponseBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(SnippetListResponseData),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ListSnippetSuccessResponseBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  ListSnippetSuccessResponseBodyAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($ListSnippetSuccessResponseBodyAllOf)) as $ListSnippetSuccessResponseBodyAllOf;
  }
}

/// a concrete implementation of [ListSnippetSuccessResponseBodyAllOf], since [ListSnippetSuccessResponseBodyAllOf] is not instantiable
@BuiltValue(instantiable: true)
abstract class $ListSnippetSuccessResponseBodyAllOf implements ListSnippetSuccessResponseBodyAllOf, Built<$ListSnippetSuccessResponseBodyAllOf, $ListSnippetSuccessResponseBodyAllOfBuilder> {
  $ListSnippetSuccessResponseBodyAllOf._();

  factory $ListSnippetSuccessResponseBodyAllOf([void Function($ListSnippetSuccessResponseBodyAllOfBuilder)? updates]) = _$$ListSnippetSuccessResponseBodyAllOf;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($ListSnippetSuccessResponseBodyAllOfBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$ListSnippetSuccessResponseBodyAllOf> get serializer => _$$ListSnippetSuccessResponseBodyAllOfSerializer();
}

class _$$ListSnippetSuccessResponseBodyAllOfSerializer implements PrimitiveSerializer<$ListSnippetSuccessResponseBodyAllOf> {
  @override
  final Iterable<Type> types = const [$ListSnippetSuccessResponseBodyAllOf, _$$ListSnippetSuccessResponseBodyAllOf];

  @override
  final String wireName = r'$ListSnippetSuccessResponseBodyAllOf';

  @override
  Object serialize(
    Serializers serializers,
    $ListSnippetSuccessResponseBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(ListSnippetSuccessResponseBodyAllOf))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ListSnippetSuccessResponseBodyAllOfBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SnippetListResponseData),
          ) as SnippetListResponseData;
          result.data.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  $ListSnippetSuccessResponseBodyAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $ListSnippetSuccessResponseBodyAllOfBuilder();
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

