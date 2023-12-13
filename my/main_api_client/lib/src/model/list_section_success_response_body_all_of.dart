//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/list_section_response_data.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'list_section_success_response_body_all_of.g.dart';

/// ListSectionSuccessResponseBodyAllOf
///
/// Properties:
/// * [data] 
@BuiltValue(instantiable: false)
abstract class ListSectionSuccessResponseBodyAllOf  {
  @BuiltValueField(wireName: r'data')
  ListSectionResponseData? get data;

  @BuiltValueSerializer(custom: true)
  static Serializer<ListSectionSuccessResponseBodyAllOf> get serializer => _$ListSectionSuccessResponseBodyAllOfSerializer();
}

class _$ListSectionSuccessResponseBodyAllOfSerializer implements PrimitiveSerializer<ListSectionSuccessResponseBodyAllOf> {
  @override
  final Iterable<Type> types = const [ListSectionSuccessResponseBodyAllOf];

  @override
  final String wireName = r'ListSectionSuccessResponseBodyAllOf';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ListSectionSuccessResponseBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(ListSectionResponseData),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ListSectionSuccessResponseBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  ListSectionSuccessResponseBodyAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($ListSectionSuccessResponseBodyAllOf)) as $ListSectionSuccessResponseBodyAllOf;
  }
}

/// a concrete implementation of [ListSectionSuccessResponseBodyAllOf], since [ListSectionSuccessResponseBodyAllOf] is not instantiable
@BuiltValue(instantiable: true)
abstract class $ListSectionSuccessResponseBodyAllOf implements ListSectionSuccessResponseBodyAllOf, Built<$ListSectionSuccessResponseBodyAllOf, $ListSectionSuccessResponseBodyAllOfBuilder> {
  $ListSectionSuccessResponseBodyAllOf._();

  factory $ListSectionSuccessResponseBodyAllOf([void Function($ListSectionSuccessResponseBodyAllOfBuilder)? updates]) = _$$ListSectionSuccessResponseBodyAllOf;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($ListSectionSuccessResponseBodyAllOfBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$ListSectionSuccessResponseBodyAllOf> get serializer => _$$ListSectionSuccessResponseBodyAllOfSerializer();
}

class _$$ListSectionSuccessResponseBodyAllOfSerializer implements PrimitiveSerializer<$ListSectionSuccessResponseBodyAllOf> {
  @override
  final Iterable<Type> types = const [$ListSectionSuccessResponseBodyAllOf, _$$ListSectionSuccessResponseBodyAllOf];

  @override
  final String wireName = r'$ListSectionSuccessResponseBodyAllOf';

  @override
  Object serialize(
    Serializers serializers,
    $ListSectionSuccessResponseBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(ListSectionSuccessResponseBodyAllOf))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ListSectionSuccessResponseBodyAllOfBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ListSectionResponseData),
          ) as ListSectionResponseData;
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
  $ListSectionSuccessResponseBodyAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $ListSectionSuccessResponseBodyAllOfBuilder();
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

