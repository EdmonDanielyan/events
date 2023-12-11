//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'subscription_config_children.g.dart';

/// Настройки блока выбора детей
///
/// Properties:
/// * [enable] - Включить блок
/// * [confirmed] - Разрешить указывать только подтверждённых
/// * [birthday] - Указывать день рождения при добавлении новых
@BuiltValue()
abstract class SubscriptionConfigChildren implements Built<SubscriptionConfigChildren, SubscriptionConfigChildrenBuilder> {
  /// Включить блок
  @BuiltValueField(wireName: r'enable')
  bool? get enable;

  /// Разрешить указывать только подтверждённых
  @BuiltValueField(wireName: r'confirmed')
  bool? get confirmed;

  /// Указывать день рождения при добавлении новых
  @BuiltValueField(wireName: r'birthday')
  bool? get birthday;

  SubscriptionConfigChildren._();

  factory SubscriptionConfigChildren([void updates(SubscriptionConfigChildrenBuilder b)]) = _$SubscriptionConfigChildren;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SubscriptionConfigChildrenBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SubscriptionConfigChildren> get serializer => _$SubscriptionConfigChildrenSerializer();
}

class _$SubscriptionConfigChildrenSerializer implements PrimitiveSerializer<SubscriptionConfigChildren> {
  @override
  final Iterable<Type> types = const [SubscriptionConfigChildren, _$SubscriptionConfigChildren];

  @override
  final String wireName = r'SubscriptionConfigChildren';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SubscriptionConfigChildren object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.enable != null) {
      yield r'enable';
      yield serializers.serialize(
        object.enable,
        specifiedType: const FullType(bool),
      );
    }
    if (object.confirmed != null) {
      yield r'confirmed';
      yield serializers.serialize(
        object.confirmed,
        specifiedType: const FullType(bool),
      );
    }
    if (object.birthday != null) {
      yield r'birthday';
      yield serializers.serialize(
        object.birthday,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SubscriptionConfigChildren object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SubscriptionConfigChildrenBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'enable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.enable = valueDes;
          break;
        case r'confirmed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.confirmed = valueDes;
          break;
        case r'birthday':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.birthday = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SubscriptionConfigChildren deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SubscriptionConfigChildrenBuilder();
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

