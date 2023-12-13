//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'subscription_config_visitors.g.dart';

/// Настройки блока выбора родственников и 3-х лиц
///
/// Properties:
/// * [enable] - Включить блок
@BuiltValue()
abstract class SubscriptionConfigVisitors implements Built<SubscriptionConfigVisitors, SubscriptionConfigVisitorsBuilder> {
  /// Включить блок
  @BuiltValueField(wireName: r'enable')
  bool? get enable;

  SubscriptionConfigVisitors._();

  factory SubscriptionConfigVisitors([void updates(SubscriptionConfigVisitorsBuilder b)]) = _$SubscriptionConfigVisitors;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SubscriptionConfigVisitorsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SubscriptionConfigVisitors> get serializer => _$SubscriptionConfigVisitorsSerializer();
}

class _$SubscriptionConfigVisitorsSerializer implements PrimitiveSerializer<SubscriptionConfigVisitors> {
  @override
  final Iterable<Type> types = const [SubscriptionConfigVisitors, _$SubscriptionConfigVisitors];

  @override
  final String wireName = r'SubscriptionConfigVisitors';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SubscriptionConfigVisitors object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.enable != null) {
      yield r'enable';
      yield serializers.serialize(
        object.enable,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SubscriptionConfigVisitors object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SubscriptionConfigVisitorsBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SubscriptionConfigVisitors deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SubscriptionConfigVisitorsBuilder();
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

