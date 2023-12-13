//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/subscription_config_visitors.dart';
import 'package:openapi/src/model/subscription_config_options.dart';
import 'package:openapi/src/model/subscription_config_children.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'subscription_config.g.dart';

/// Настройки формы универсальной записи на событие (если доступна запись)
///
/// Properties:
/// * [options] 
/// * [children] 
/// * [visitors] 
@BuiltValue()
abstract class SubscriptionConfig implements Built<SubscriptionConfig, SubscriptionConfigBuilder> {
  @BuiltValueField(wireName: r'options')
  SubscriptionConfigOptions? get options;

  @BuiltValueField(wireName: r'children')
  SubscriptionConfigChildren? get children;

  @BuiltValueField(wireName: r'visitors')
  SubscriptionConfigVisitors? get visitors;

  SubscriptionConfig._();

  factory SubscriptionConfig([void updates(SubscriptionConfigBuilder b)]) = _$SubscriptionConfig;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SubscriptionConfigBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SubscriptionConfig> get serializer => _$SubscriptionConfigSerializer();
}

class _$SubscriptionConfigSerializer implements PrimitiveSerializer<SubscriptionConfig> {
  @override
  final Iterable<Type> types = const [SubscriptionConfig, _$SubscriptionConfig];

  @override
  final String wireName = r'SubscriptionConfig';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SubscriptionConfig object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.options != null) {
      yield r'options';
      yield serializers.serialize(
        object.options,
        specifiedType: const FullType(SubscriptionConfigOptions),
      );
    }
    if (object.children != null) {
      yield r'children';
      yield serializers.serialize(
        object.children,
        specifiedType: const FullType(SubscriptionConfigChildren),
      );
    }
    if (object.visitors != null) {
      yield r'visitors';
      yield serializers.serialize(
        object.visitors,
        specifiedType: const FullType(SubscriptionConfigVisitors),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SubscriptionConfig object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SubscriptionConfigBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'options':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SubscriptionConfigOptions),
          ) as SubscriptionConfigOptions;
          result.options.replace(valueDes);
          break;
        case r'children':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SubscriptionConfigChildren),
          ) as SubscriptionConfigChildren;
          result.children.replace(valueDes);
          break;
        case r'visitors':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SubscriptionConfigVisitors),
          ) as SubscriptionConfigVisitors;
          result.visitors.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SubscriptionConfig deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SubscriptionConfigBuilder();
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

