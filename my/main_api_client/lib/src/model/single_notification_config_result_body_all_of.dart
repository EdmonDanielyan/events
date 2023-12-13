//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/notification_sub_state.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'single_notification_config_result_body_all_of.g.dart';

/// SingleNotificationConfigResultBodyAllOf
///
/// Properties:
/// * [data] 
@BuiltValue(instantiable: false)
abstract class SingleNotificationConfigResultBodyAllOf  {
  @BuiltValueField(wireName: r'data')
  NotificationSubState? get data;

  @BuiltValueSerializer(custom: true)
  static Serializer<SingleNotificationConfigResultBodyAllOf> get serializer => _$SingleNotificationConfigResultBodyAllOfSerializer();
}

class _$SingleNotificationConfigResultBodyAllOfSerializer implements PrimitiveSerializer<SingleNotificationConfigResultBodyAllOf> {
  @override
  final Iterable<Type> types = const [SingleNotificationConfigResultBodyAllOf];

  @override
  final String wireName = r'SingleNotificationConfigResultBodyAllOf';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SingleNotificationConfigResultBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(NotificationSubState),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SingleNotificationConfigResultBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  SingleNotificationConfigResultBodyAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($SingleNotificationConfigResultBodyAllOf)) as $SingleNotificationConfigResultBodyAllOf;
  }
}

/// a concrete implementation of [SingleNotificationConfigResultBodyAllOf], since [SingleNotificationConfigResultBodyAllOf] is not instantiable
@BuiltValue(instantiable: true)
abstract class $SingleNotificationConfigResultBodyAllOf implements SingleNotificationConfigResultBodyAllOf, Built<$SingleNotificationConfigResultBodyAllOf, $SingleNotificationConfigResultBodyAllOfBuilder> {
  $SingleNotificationConfigResultBodyAllOf._();

  factory $SingleNotificationConfigResultBodyAllOf([void Function($SingleNotificationConfigResultBodyAllOfBuilder)? updates]) = _$$SingleNotificationConfigResultBodyAllOf;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($SingleNotificationConfigResultBodyAllOfBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$SingleNotificationConfigResultBodyAllOf> get serializer => _$$SingleNotificationConfigResultBodyAllOfSerializer();
}

class _$$SingleNotificationConfigResultBodyAllOfSerializer implements PrimitiveSerializer<$SingleNotificationConfigResultBodyAllOf> {
  @override
  final Iterable<Type> types = const [$SingleNotificationConfigResultBodyAllOf, _$$SingleNotificationConfigResultBodyAllOf];

  @override
  final String wireName = r'$SingleNotificationConfigResultBodyAllOf';

  @override
  Object serialize(
    Serializers serializers,
    $SingleNotificationConfigResultBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(SingleNotificationConfigResultBodyAllOf))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SingleNotificationConfigResultBodyAllOfBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(NotificationSubState),
          ) as NotificationSubState;
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
  $SingleNotificationConfigResultBodyAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $SingleNotificationConfigResultBodyAllOfBuilder();
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

