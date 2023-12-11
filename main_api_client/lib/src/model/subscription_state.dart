//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/subscription_config.dart';
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/subscription_field.dart';
import 'package:openapi/src/model/subscription_option.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'subscription_state.g.dart';

/// Состояние подписки на событие для текущего пользователя
///
/// Properties:
/// * [v] - Версия формата
/// * [id] - ID события записи
/// * [subscribed] - Пользователь подписан на событие
/// * [canSubscribe] - Можно записаться на событие
/// * [canUnsubscribe] - Можно отменить запись
/// * [statusMessage] - Доп. сообщение с причиной невозможности подписки/отписки
/// * [config] 
/// * [fields] - Поля формы записи (если доступна запись)
/// * [options] - Опции формы записи (если доступна запись)
/// * [tickets] - Ссылки на файлы с билетами (если записан)
/// * [placesLimit] - Количество мест (для отладки)
/// * [placesLeft] - Количество свободных мест (для отладки)
@BuiltValue()
abstract class SubscriptionState implements Built<SubscriptionState, SubscriptionStateBuilder> {
  /// Версия формата
  @BuiltValueField(wireName: r'v')
  int? get v;

  /// ID события записи
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// Пользователь подписан на событие
  @BuiltValueField(wireName: r'subscribed')
  bool? get subscribed;

  /// Можно записаться на событие
  @BuiltValueField(wireName: r'canSubscribe')
  bool? get canSubscribe;

  /// Можно отменить запись
  @BuiltValueField(wireName: r'canUnsubscribe')
  bool? get canUnsubscribe;

  /// Доп. сообщение с причиной невозможности подписки/отписки
  @BuiltValueField(wireName: r'statusMessage')
  String? get statusMessage;

  @BuiltValueField(wireName: r'config')
  SubscriptionConfig? get config;

  /// Поля формы записи (если доступна запись)
  @BuiltValueField(wireName: r'fields')
  BuiltList<SubscriptionField>? get fields;

  /// Опции формы записи (если доступна запись)
  @BuiltValueField(wireName: r'options')
  BuiltList<SubscriptionOption>? get options;

  /// Ссылки на файлы с билетами (если записан)
  @BuiltValueField(wireName: r'tickets')
  BuiltList<String>? get tickets;

  /// Количество мест (для отладки)
  @BuiltValueField(wireName: r'placesLimit')
  int? get placesLimit;

  /// Количество свободных мест (для отладки)
  @BuiltValueField(wireName: r'placesLeft')
  int? get placesLeft;

  SubscriptionState._();

  factory SubscriptionState([void updates(SubscriptionStateBuilder b)]) = _$SubscriptionState;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SubscriptionStateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SubscriptionState> get serializer => _$SubscriptionStateSerializer();
}

class _$SubscriptionStateSerializer implements PrimitiveSerializer<SubscriptionState> {
  @override
  final Iterable<Type> types = const [SubscriptionState, _$SubscriptionState];

  @override
  final String wireName = r'SubscriptionState';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SubscriptionState object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.v != null) {
      yield r'v';
      yield serializers.serialize(
        object.v,
        specifiedType: const FullType(int),
      );
    }
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.subscribed != null) {
      yield r'subscribed';
      yield serializers.serialize(
        object.subscribed,
        specifiedType: const FullType(bool),
      );
    }
    if (object.canSubscribe != null) {
      yield r'canSubscribe';
      yield serializers.serialize(
        object.canSubscribe,
        specifiedType: const FullType(bool),
      );
    }
    if (object.canUnsubscribe != null) {
      yield r'canUnsubscribe';
      yield serializers.serialize(
        object.canUnsubscribe,
        specifiedType: const FullType(bool),
      );
    }
    if (object.statusMessage != null) {
      yield r'statusMessage';
      yield serializers.serialize(
        object.statusMessage,
        specifiedType: const FullType(String),
      );
    }
    if (object.config != null) {
      yield r'config';
      yield serializers.serialize(
        object.config,
        specifiedType: const FullType(SubscriptionConfig),
      );
    }
    if (object.fields != null) {
      yield r'fields';
      yield serializers.serialize(
        object.fields,
        specifiedType: const FullType(BuiltList, [FullType(SubscriptionField)]),
      );
    }
    if (object.options != null) {
      yield r'options';
      yield serializers.serialize(
        object.options,
        specifiedType: const FullType(BuiltList, [FullType(SubscriptionOption)]),
      );
    }
    if (object.tickets != null) {
      yield r'tickets';
      yield serializers.serialize(
        object.tickets,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.placesLimit != null) {
      yield r'placesLimit';
      yield serializers.serialize(
        object.placesLimit,
        specifiedType: const FullType(int),
      );
    }
    if (object.placesLeft != null) {
      yield r'placesLeft';
      yield serializers.serialize(
        object.placesLeft,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SubscriptionState object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SubscriptionStateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'v':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.v = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'subscribed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.subscribed = valueDes;
          break;
        case r'canSubscribe':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.canSubscribe = valueDes;
          break;
        case r'canUnsubscribe':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.canUnsubscribe = valueDes;
          break;
        case r'statusMessage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.statusMessage = valueDes;
          break;
        case r'config':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SubscriptionConfig),
          ) as SubscriptionConfig;
          result.config.replace(valueDes);
          break;
        case r'fields':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(SubscriptionField)]),
          ) as BuiltList<SubscriptionField>;
          result.fields.replace(valueDes);
          break;
        case r'options':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(SubscriptionOption)]),
          ) as BuiltList<SubscriptionOption>;
          result.options.replace(valueDes);
          break;
        case r'tickets':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.tickets.replace(valueDes);
          break;
        case r'placesLimit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.placesLimit = valueDes;
          break;
        case r'placesLeft':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.placesLeft = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SubscriptionState deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SubscriptionStateBuilder();
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

