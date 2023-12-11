//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'subscription_option.g.dart';

/// Параметры опции формы универсальной записи
///
/// Properties:
/// * [id] - IВ
/// * [title] - Заголовок
/// * [description] - Описание
/// * [image] - Картинка
/// * [limit] - Мест всего (null - не ограниченно)
/// * [left] - Мест осталось (null - не ограниченно)
/// * [dateStart] - Дата и время начала (для режима календаря)
/// * [dateEnd] - Дата и время окончания (для режима календаря)
/// * [available] - Доступно для выбора. Если null - считать как true. Если false - отобразить, но не давать выбрать.
@BuiltValue()
abstract class SubscriptionOption implements Built<SubscriptionOption, SubscriptionOptionBuilder> {
  /// IВ
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// Заголовок
  @BuiltValueField(wireName: r'title')
  String? get title;

  /// Описание
  @BuiltValueField(wireName: r'description')
  String? get description;

  /// Картинка
  @BuiltValueField(wireName: r'image')
  String? get image;

  /// Мест всего (null - не ограниченно)
  @BuiltValueField(wireName: r'limit')
  int? get limit;

  /// Мест осталось (null - не ограниченно)
  @BuiltValueField(wireName: r'left')
  int? get left;

  /// Дата и время начала (для режима календаря)
  @BuiltValueField(wireName: r'dateStart')
  DateTime? get dateStart;

  /// Дата и время окончания (для режима календаря)
  @BuiltValueField(wireName: r'dateEnd')
  DateTime? get dateEnd;

  /// Доступно для выбора. Если null - считать как true. Если false - отобразить, но не давать выбрать.
  @BuiltValueField(wireName: r'available')
  bool? get available;

  SubscriptionOption._();

  factory SubscriptionOption([void updates(SubscriptionOptionBuilder b)]) = _$SubscriptionOption;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SubscriptionOptionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SubscriptionOption> get serializer => _$SubscriptionOptionSerializer();
}

class _$SubscriptionOptionSerializer implements PrimitiveSerializer<SubscriptionOption> {
  @override
  final Iterable<Type> types = const [SubscriptionOption, _$SubscriptionOption];

  @override
  final String wireName = r'SubscriptionOption';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SubscriptionOption object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType(String),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    if (object.image != null) {
      yield r'image';
      yield serializers.serialize(
        object.image,
        specifiedType: const FullType(String),
      );
    }
    if (object.limit != null) {
      yield r'limit';
      yield serializers.serialize(
        object.limit,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.left != null) {
      yield r'left';
      yield serializers.serialize(
        object.left,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.dateStart != null) {
      yield r'dateStart';
      yield serializers.serialize(
        object.dateStart,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.dateEnd != null) {
      yield r'dateEnd';
      yield serializers.serialize(
        object.dateEnd,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.available != null) {
      yield r'available';
      yield serializers.serialize(
        object.available,
        specifiedType: const FullType.nullable(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SubscriptionOption object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SubscriptionOptionBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'image':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.image = valueDes;
          break;
        case r'limit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.limit = valueDes;
          break;
        case r'left':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.left = valueDes;
          break;
        case r'dateStart':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.dateStart = valueDes;
          break;
        case r'dateEnd':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.dateEnd = valueDes;
          break;
        case r'available':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.available = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SubscriptionOption deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SubscriptionOptionBuilder();
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

