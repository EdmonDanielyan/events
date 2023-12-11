//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'notification_full_list.g.dart';

/// Список ВСЕХ подписок на уведомления. Ключи - группы уведомлений. 
///
/// Properties:
/// * [chats] - Список подписок на уведомления определённого типа. Подписки со значением \"по умолчанию\" не выводятся. Ключ - ID истоника уведомлений (напр. чата). Значение - состояние подписки. Значение с ключом \"_default\" - состояние по умолчанию для группы. Для чатов ключи: * просто число - ID группового чата * system - канал уведомлений * число с префиксом u - ID собеседника для приватного 
@BuiltValue()
abstract class NotificationFullList implements Built<NotificationFullList, NotificationFullListBuilder> {
  /// Список подписок на уведомления определённого типа. Подписки со значением \"по умолчанию\" не выводятся. Ключ - ID истоника уведомлений (напр. чата). Значение - состояние подписки. Значение с ключом \"_default\" - состояние по умолчанию для группы. Для чатов ключи: * просто число - ID группового чата * system - канал уведомлений * число с префиксом u - ID собеседника для приватного 
  @BuiltValueField(wireName: r'chats')
  BuiltList<bool>? get chats;

  NotificationFullList._();

  factory NotificationFullList([void updates(NotificationFullListBuilder b)]) = _$NotificationFullList;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NotificationFullListBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NotificationFullList> get serializer => _$NotificationFullListSerializer();
}

class _$NotificationFullListSerializer implements PrimitiveSerializer<NotificationFullList> {
  @override
  final Iterable<Type> types = const [NotificationFullList, _$NotificationFullList];

  @override
  final String wireName = r'NotificationFullList';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NotificationFullList object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.chats != null) {
      yield r'chats';
      yield serializers.serialize(
        object.chats,
        specifiedType: const FullType(BuiltList, [FullType(bool)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    NotificationFullList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required NotificationFullListBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'chats':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(bool)]),
          ) as BuiltList<bool>;
          result.chats.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  NotificationFullList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NotificationFullListBuilder();
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

