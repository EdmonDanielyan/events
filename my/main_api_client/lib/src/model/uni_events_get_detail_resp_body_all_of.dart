//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/uni_events_get_detail_resp_body_all_of_data.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'uni_events_get_detail_resp_body_all_of.g.dart';

/// UniEventsGetDetailRespBodyAllOf
///
/// Properties:
/// * [data] 
@BuiltValue(instantiable: false)
abstract class UniEventsGetDetailRespBodyAllOf  {
  @BuiltValueField(wireName: r'data')
  UniEventsGetDetailRespBodyAllOfData get data;

  @BuiltValueSerializer(custom: true)
  static Serializer<UniEventsGetDetailRespBodyAllOf> get serializer => _$UniEventsGetDetailRespBodyAllOfSerializer();
}

class _$UniEventsGetDetailRespBodyAllOfSerializer implements PrimitiveSerializer<UniEventsGetDetailRespBodyAllOf> {
  @override
  final Iterable<Type> types = const [UniEventsGetDetailRespBodyAllOf];

  @override
  final String wireName = r'UniEventsGetDetailRespBodyAllOf';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UniEventsGetDetailRespBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(UniEventsGetDetailRespBodyAllOfData),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UniEventsGetDetailRespBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  UniEventsGetDetailRespBodyAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($UniEventsGetDetailRespBodyAllOf)) as $UniEventsGetDetailRespBodyAllOf;
  }
}

/// a concrete implementation of [UniEventsGetDetailRespBodyAllOf], since [UniEventsGetDetailRespBodyAllOf] is not instantiable
@BuiltValue(instantiable: true)
abstract class $UniEventsGetDetailRespBodyAllOf implements UniEventsGetDetailRespBodyAllOf, Built<$UniEventsGetDetailRespBodyAllOf, $UniEventsGetDetailRespBodyAllOfBuilder> {
  $UniEventsGetDetailRespBodyAllOf._();

  factory $UniEventsGetDetailRespBodyAllOf([void Function($UniEventsGetDetailRespBodyAllOfBuilder)? updates]) = _$$UniEventsGetDetailRespBodyAllOf;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($UniEventsGetDetailRespBodyAllOfBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$UniEventsGetDetailRespBodyAllOf> get serializer => _$$UniEventsGetDetailRespBodyAllOfSerializer();
}

class _$$UniEventsGetDetailRespBodyAllOfSerializer implements PrimitiveSerializer<$UniEventsGetDetailRespBodyAllOf> {
  @override
  final Iterable<Type> types = const [$UniEventsGetDetailRespBodyAllOf, _$$UniEventsGetDetailRespBodyAllOf];

  @override
  final String wireName = r'$UniEventsGetDetailRespBodyAllOf';

  @override
  Object serialize(
    Serializers serializers,
    $UniEventsGetDetailRespBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(UniEventsGetDetailRespBodyAllOf))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UniEventsGetDetailRespBodyAllOfBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UniEventsGetDetailRespBodyAllOfData),
          ) as UniEventsGetDetailRespBodyAllOfData;
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
  $UniEventsGetDetailRespBodyAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $UniEventsGetDetailRespBodyAllOfBuilder();
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

