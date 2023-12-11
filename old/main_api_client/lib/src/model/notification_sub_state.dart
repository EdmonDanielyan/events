//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'notification_sub_state.g.dart';

/// Сотяние подписки на единичное уведомлениие
///
/// Properties:
/// * [value] - TRUE - подписан. FALSE - не подписан. NULL - по умолчанию.
@BuiltValue()
abstract class NotificationSubState implements Built<NotificationSubState, NotificationSubStateBuilder> {
  /// TRUE - подписан. FALSE - не подписан. NULL - по умолчанию.
  @BuiltValueField(wireName: r'value')
  bool? get value;

  NotificationSubState._();

  factory NotificationSubState([void updates(NotificationSubStateBuilder b)]) = _$NotificationSubState;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NotificationSubStateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NotificationSubState> get serializer => _$NotificationSubStateSerializer();
}

class _$NotificationSubStateSerializer implements PrimitiveSerializer<NotificationSubState> {
  @override
  final Iterable<Type> types = const [NotificationSubState, _$NotificationSubState];

  @override
  final String wireName = r'NotificationSubState';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NotificationSubState object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.value != null) {
      yield r'value';
      yield serializers.serialize(
        object.value,
        specifiedType: const FullType.nullable(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    NotificationSubState object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required NotificationSubStateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.value = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  NotificationSubState deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NotificationSubStateBuilder();
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

