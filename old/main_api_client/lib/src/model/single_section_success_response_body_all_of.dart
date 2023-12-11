//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/single_section_response_data.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'single_section_success_response_body_all_of.g.dart';

/// SingleSectionSuccessResponseBodyAllOf
///
/// Properties:
/// * [data] 
@BuiltValue(instantiable: false)
abstract class SingleSectionSuccessResponseBodyAllOf  {
  @BuiltValueField(wireName: r'data')
  SingleSectionResponseData? get data;

  @BuiltValueSerializer(custom: true)
  static Serializer<SingleSectionSuccessResponseBodyAllOf> get serializer => _$SingleSectionSuccessResponseBodyAllOfSerializer();
}

class _$SingleSectionSuccessResponseBodyAllOfSerializer implements PrimitiveSerializer<SingleSectionSuccessResponseBodyAllOf> {
  @override
  final Iterable<Type> types = const [SingleSectionSuccessResponseBodyAllOf];

  @override
  final String wireName = r'SingleSectionSuccessResponseBodyAllOf';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SingleSectionSuccessResponseBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(SingleSectionResponseData),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SingleSectionSuccessResponseBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  SingleSectionSuccessResponseBodyAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($SingleSectionSuccessResponseBodyAllOf)) as $SingleSectionSuccessResponseBodyAllOf;
  }
}

/// a concrete implementation of [SingleSectionSuccessResponseBodyAllOf], since [SingleSectionSuccessResponseBodyAllOf] is not instantiable
@BuiltValue(instantiable: true)
abstract class $SingleSectionSuccessResponseBodyAllOf implements SingleSectionSuccessResponseBodyAllOf, Built<$SingleSectionSuccessResponseBodyAllOf, $SingleSectionSuccessResponseBodyAllOfBuilder> {
  $SingleSectionSuccessResponseBodyAllOf._();

  factory $SingleSectionSuccessResponseBodyAllOf([void Function($SingleSectionSuccessResponseBodyAllOfBuilder)? updates]) = _$$SingleSectionSuccessResponseBodyAllOf;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($SingleSectionSuccessResponseBodyAllOfBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$SingleSectionSuccessResponseBodyAllOf> get serializer => _$$SingleSectionSuccessResponseBodyAllOfSerializer();
}

class _$$SingleSectionSuccessResponseBodyAllOfSerializer implements PrimitiveSerializer<$SingleSectionSuccessResponseBodyAllOf> {
  @override
  final Iterable<Type> types = const [$SingleSectionSuccessResponseBodyAllOf, _$$SingleSectionSuccessResponseBodyAllOf];

  @override
  final String wireName = r'$SingleSectionSuccessResponseBodyAllOf';

  @override
  Object serialize(
    Serializers serializers,
    $SingleSectionSuccessResponseBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(SingleSectionSuccessResponseBodyAllOf))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SingleSectionSuccessResponseBodyAllOfBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SingleSectionResponseData),
          ) as SingleSectionResponseData;
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
  $SingleSectionSuccessResponseBodyAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $SingleSectionSuccessResponseBodyAllOfBuilder();
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

