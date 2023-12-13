//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/list_page_response_data.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'list_page_success_response_body_all_of.g.dart';

/// ListPageSuccessResponseBodyAllOf
///
/// Properties:
/// * [data] 
@BuiltValue(instantiable: false)
abstract class ListPageSuccessResponseBodyAllOf  {
  @BuiltValueField(wireName: r'data')
  ListPageResponseData? get data;

  @BuiltValueSerializer(custom: true)
  static Serializer<ListPageSuccessResponseBodyAllOf> get serializer => _$ListPageSuccessResponseBodyAllOfSerializer();
}

class _$ListPageSuccessResponseBodyAllOfSerializer implements PrimitiveSerializer<ListPageSuccessResponseBodyAllOf> {
  @override
  final Iterable<Type> types = const [ListPageSuccessResponseBodyAllOf];

  @override
  final String wireName = r'ListPageSuccessResponseBodyAllOf';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ListPageSuccessResponseBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(ListPageResponseData),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ListPageSuccessResponseBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  ListPageSuccessResponseBodyAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($ListPageSuccessResponseBodyAllOf)) as $ListPageSuccessResponseBodyAllOf;
  }
}

/// a concrete implementation of [ListPageSuccessResponseBodyAllOf], since [ListPageSuccessResponseBodyAllOf] is not instantiable
@BuiltValue(instantiable: true)
abstract class $ListPageSuccessResponseBodyAllOf implements ListPageSuccessResponseBodyAllOf, Built<$ListPageSuccessResponseBodyAllOf, $ListPageSuccessResponseBodyAllOfBuilder> {
  $ListPageSuccessResponseBodyAllOf._();

  factory $ListPageSuccessResponseBodyAllOf([void Function($ListPageSuccessResponseBodyAllOfBuilder)? updates]) = _$$ListPageSuccessResponseBodyAllOf;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($ListPageSuccessResponseBodyAllOfBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$ListPageSuccessResponseBodyAllOf> get serializer => _$$ListPageSuccessResponseBodyAllOfSerializer();
}

class _$$ListPageSuccessResponseBodyAllOfSerializer implements PrimitiveSerializer<$ListPageSuccessResponseBodyAllOf> {
  @override
  final Iterable<Type> types = const [$ListPageSuccessResponseBodyAllOf, _$$ListPageSuccessResponseBodyAllOf];

  @override
  final String wireName = r'$ListPageSuccessResponseBodyAllOf';

  @override
  Object serialize(
    Serializers serializers,
    $ListPageSuccessResponseBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(ListPageSuccessResponseBodyAllOf))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ListPageSuccessResponseBodyAllOfBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ListPageResponseData),
          ) as ListPageResponseData;
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
  $ListPageSuccessResponseBodyAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $ListPageSuccessResponseBodyAllOfBuilder();
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

