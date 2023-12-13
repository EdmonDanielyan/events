//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/subscription_state.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'uni_sub_get_state_resp_body_all_of.g.dart';

/// UniSubGetStateRespBodyAllOf
///
/// Properties:
/// * [data] 
@BuiltValue(instantiable: false)
abstract class UniSubGetStateRespBodyAllOf  {
  @BuiltValueField(wireName: r'data')
  SubscriptionState get data;

  @BuiltValueSerializer(custom: true)
  static Serializer<UniSubGetStateRespBodyAllOf> get serializer => _$UniSubGetStateRespBodyAllOfSerializer();
}

class _$UniSubGetStateRespBodyAllOfSerializer implements PrimitiveSerializer<UniSubGetStateRespBodyAllOf> {
  @override
  final Iterable<Type> types = const [UniSubGetStateRespBodyAllOf];

  @override
  final String wireName = r'UniSubGetStateRespBodyAllOf';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UniSubGetStateRespBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(SubscriptionState),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UniSubGetStateRespBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  UniSubGetStateRespBodyAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($UniSubGetStateRespBodyAllOf)) as $UniSubGetStateRespBodyAllOf;
  }
}

/// a concrete implementation of [UniSubGetStateRespBodyAllOf], since [UniSubGetStateRespBodyAllOf] is not instantiable
@BuiltValue(instantiable: true)
abstract class $UniSubGetStateRespBodyAllOf implements UniSubGetStateRespBodyAllOf, Built<$UniSubGetStateRespBodyAllOf, $UniSubGetStateRespBodyAllOfBuilder> {
  $UniSubGetStateRespBodyAllOf._();

  factory $UniSubGetStateRespBodyAllOf([void Function($UniSubGetStateRespBodyAllOfBuilder)? updates]) = _$$UniSubGetStateRespBodyAllOf;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($UniSubGetStateRespBodyAllOfBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$UniSubGetStateRespBodyAllOf> get serializer => _$$UniSubGetStateRespBodyAllOfSerializer();
}

class _$$UniSubGetStateRespBodyAllOfSerializer implements PrimitiveSerializer<$UniSubGetStateRespBodyAllOf> {
  @override
  final Iterable<Type> types = const [$UniSubGetStateRespBodyAllOf, _$$UniSubGetStateRespBodyAllOf];

  @override
  final String wireName = r'$UniSubGetStateRespBodyAllOf';

  @override
  Object serialize(
    Serializers serializers,
    $UniSubGetStateRespBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(UniSubGetStateRespBodyAllOf))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UniSubGetStateRespBodyAllOfBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SubscriptionState),
          ) as SubscriptionState;
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
  $UniSubGetStateRespBodyAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $UniSubGetStateRespBodyAllOfBuilder();
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

