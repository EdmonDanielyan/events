//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/uni_events_get_list_resp_body_all_of_data.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'uni_events_get_list_resp_body_all_of.g.dart';

/// UniEventsGetListRespBodyAllOf
///
/// Properties:
/// * [data] 
@BuiltValue(instantiable: false)
abstract class UniEventsGetListRespBodyAllOf  {
  @BuiltValueField(wireName: r'data')
  UniEventsGetListRespBodyAllOfData get data;

  @BuiltValueSerializer(custom: true)
  static Serializer<UniEventsGetListRespBodyAllOf> get serializer => _$UniEventsGetListRespBodyAllOfSerializer();
}

class _$UniEventsGetListRespBodyAllOfSerializer implements PrimitiveSerializer<UniEventsGetListRespBodyAllOf> {
  @override
  final Iterable<Type> types = const [UniEventsGetListRespBodyAllOf];

  @override
  final String wireName = r'UniEventsGetListRespBodyAllOf';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UniEventsGetListRespBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(UniEventsGetListRespBodyAllOfData),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UniEventsGetListRespBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  UniEventsGetListRespBodyAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($UniEventsGetListRespBodyAllOf)) as $UniEventsGetListRespBodyAllOf;
  }
}

/// a concrete implementation of [UniEventsGetListRespBodyAllOf], since [UniEventsGetListRespBodyAllOf] is not instantiable
@BuiltValue(instantiable: true)
abstract class $UniEventsGetListRespBodyAllOf implements UniEventsGetListRespBodyAllOf, Built<$UniEventsGetListRespBodyAllOf, $UniEventsGetListRespBodyAllOfBuilder> {
  $UniEventsGetListRespBodyAllOf._();

  factory $UniEventsGetListRespBodyAllOf([void Function($UniEventsGetListRespBodyAllOfBuilder)? updates]) = _$$UniEventsGetListRespBodyAllOf;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($UniEventsGetListRespBodyAllOfBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$UniEventsGetListRespBodyAllOf> get serializer => _$$UniEventsGetListRespBodyAllOfSerializer();
}

class _$$UniEventsGetListRespBodyAllOfSerializer implements PrimitiveSerializer<$UniEventsGetListRespBodyAllOf> {
  @override
  final Iterable<Type> types = const [$UniEventsGetListRespBodyAllOf, _$$UniEventsGetListRespBodyAllOf];

  @override
  final String wireName = r'$UniEventsGetListRespBodyAllOf';

  @override
  Object serialize(
    Serializers serializers,
    $UniEventsGetListRespBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(UniEventsGetListRespBodyAllOf))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UniEventsGetListRespBodyAllOfBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UniEventsGetListRespBodyAllOfData),
          ) as UniEventsGetListRespBodyAllOfData;
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
  $UniEventsGetListRespBodyAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $UniEventsGetListRespBodyAllOfBuilder();
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

