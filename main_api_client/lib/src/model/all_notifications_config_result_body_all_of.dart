//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/notification_full_list.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'all_notifications_config_result_body_all_of.g.dart';

/// AllNotificationsConfigResultBodyAllOf
///
/// Properties:
/// * [data] 
@BuiltValue(instantiable: false)
abstract class AllNotificationsConfigResultBodyAllOf  {
  @BuiltValueField(wireName: r'data')
  NotificationFullList? get data;

  @BuiltValueSerializer(custom: true)
  static Serializer<AllNotificationsConfigResultBodyAllOf> get serializer => _$AllNotificationsConfigResultBodyAllOfSerializer();
}

class _$AllNotificationsConfigResultBodyAllOfSerializer implements PrimitiveSerializer<AllNotificationsConfigResultBodyAllOf> {
  @override
  final Iterable<Type> types = const [AllNotificationsConfigResultBodyAllOf];

  @override
  final String wireName = r'AllNotificationsConfigResultBodyAllOf';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AllNotificationsConfigResultBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(NotificationFullList),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AllNotificationsConfigResultBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  AllNotificationsConfigResultBodyAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($AllNotificationsConfigResultBodyAllOf)) as $AllNotificationsConfigResultBodyAllOf;
  }
}

/// a concrete implementation of [AllNotificationsConfigResultBodyAllOf], since [AllNotificationsConfigResultBodyAllOf] is not instantiable
@BuiltValue(instantiable: true)
abstract class $AllNotificationsConfigResultBodyAllOf implements AllNotificationsConfigResultBodyAllOf, Built<$AllNotificationsConfigResultBodyAllOf, $AllNotificationsConfigResultBodyAllOfBuilder> {
  $AllNotificationsConfigResultBodyAllOf._();

  factory $AllNotificationsConfigResultBodyAllOf([void Function($AllNotificationsConfigResultBodyAllOfBuilder)? updates]) = _$$AllNotificationsConfigResultBodyAllOf;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($AllNotificationsConfigResultBodyAllOfBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$AllNotificationsConfigResultBodyAllOf> get serializer => _$$AllNotificationsConfigResultBodyAllOfSerializer();
}

class _$$AllNotificationsConfigResultBodyAllOfSerializer implements PrimitiveSerializer<$AllNotificationsConfigResultBodyAllOf> {
  @override
  final Iterable<Type> types = const [$AllNotificationsConfigResultBodyAllOf, _$$AllNotificationsConfigResultBodyAllOf];

  @override
  final String wireName = r'$AllNotificationsConfigResultBodyAllOf';

  @override
  Object serialize(
    Serializers serializers,
    $AllNotificationsConfigResultBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(AllNotificationsConfigResultBodyAllOf))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AllNotificationsConfigResultBodyAllOfBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(NotificationFullList),
          ) as NotificationFullList;
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
  $AllNotificationsConfigResultBodyAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $AllNotificationsConfigResultBodyAllOfBuilder();
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

