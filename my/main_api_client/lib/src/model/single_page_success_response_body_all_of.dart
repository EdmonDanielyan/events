//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/single_page_response_data.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'single_page_success_response_body_all_of.g.dart';

/// SinglePageSuccessResponseBodyAllOf
///
/// Properties:
/// * [data] 
@BuiltValue(instantiable: false)
abstract class SinglePageSuccessResponseBodyAllOf  {
  @BuiltValueField(wireName: r'data')
  SinglePageResponseData? get data;

  @BuiltValueSerializer(custom: true)
  static Serializer<SinglePageSuccessResponseBodyAllOf> get serializer => _$SinglePageSuccessResponseBodyAllOfSerializer();
}

class _$SinglePageSuccessResponseBodyAllOfSerializer implements PrimitiveSerializer<SinglePageSuccessResponseBodyAllOf> {
  @override
  final Iterable<Type> types = const [SinglePageSuccessResponseBodyAllOf];

  @override
  final String wireName = r'SinglePageSuccessResponseBodyAllOf';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SinglePageSuccessResponseBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(SinglePageResponseData),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SinglePageSuccessResponseBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  SinglePageSuccessResponseBodyAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($SinglePageSuccessResponseBodyAllOf)) as $SinglePageSuccessResponseBodyAllOf;
  }
}

/// a concrete implementation of [SinglePageSuccessResponseBodyAllOf], since [SinglePageSuccessResponseBodyAllOf] is not instantiable
@BuiltValue(instantiable: true)
abstract class $SinglePageSuccessResponseBodyAllOf implements SinglePageSuccessResponseBodyAllOf, Built<$SinglePageSuccessResponseBodyAllOf, $SinglePageSuccessResponseBodyAllOfBuilder> {
  $SinglePageSuccessResponseBodyAllOf._();

  factory $SinglePageSuccessResponseBodyAllOf([void Function($SinglePageSuccessResponseBodyAllOfBuilder)? updates]) = _$$SinglePageSuccessResponseBodyAllOf;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($SinglePageSuccessResponseBodyAllOfBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$SinglePageSuccessResponseBodyAllOf> get serializer => _$$SinglePageSuccessResponseBodyAllOfSerializer();
}

class _$$SinglePageSuccessResponseBodyAllOfSerializer implements PrimitiveSerializer<$SinglePageSuccessResponseBodyAllOf> {
  @override
  final Iterable<Type> types = const [$SinglePageSuccessResponseBodyAllOf, _$$SinglePageSuccessResponseBodyAllOf];

  @override
  final String wireName = r'$SinglePageSuccessResponseBodyAllOf';

  @override
  Object serialize(
    Serializers serializers,
    $SinglePageSuccessResponseBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(SinglePageSuccessResponseBodyAllOf))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SinglePageSuccessResponseBodyAllOfBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SinglePageResponseData),
          ) as SinglePageResponseData;
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
  $SinglePageSuccessResponseBodyAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $SinglePageSuccessResponseBodyAllOfBuilder();
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

