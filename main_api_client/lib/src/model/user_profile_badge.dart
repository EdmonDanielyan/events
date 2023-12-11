//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_profile_badge.g.dart';

/// Статус/бейдж/награда
///
/// Properties:
/// * [code] - Символьный код (ниже первого уровня не уникальный)
/// * [name] - Название
/// * [group] - Группа (например на доске почёта награды разбиты по категориям)
/// * [icon] - Имя ассета иконки
/// * [svg] - Полный код иконки в svg. Используется, если поле icon не задано.
/// * [count] - Количество, если задано отображается рябом с бейджем
/// * [label] - Короткая текстовая подпись вместо количества (пока не используется)
/// * [link] - Ссылка для перехода на описание статуса (пока не используется)
/// * [extra] - Доп. данные для уникальных случаев
/// * [subs] - Датализация для \"составных\" статусов
@BuiltValue()
abstract class UserProfileBadge implements Built<UserProfileBadge, UserProfileBadgeBuilder> {
  /// Символьный код (ниже первого уровня не уникальный)
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Название
  @BuiltValueField(wireName: r'name')
  String get name;

  /// Группа (например на доске почёта награды разбиты по категориям)
  @BuiltValueField(wireName: r'group')
  String? get group;

  /// Имя ассета иконки
  @BuiltValueField(wireName: r'icon')
  String? get icon;

  /// Полный код иконки в svg. Используется, если поле icon не задано.
  @BuiltValueField(wireName: r'svg')
  String? get svg;

  /// Количество, если задано отображается рябом с бейджем
  @BuiltValueField(wireName: r'count')
  num? get count;

  /// Короткая текстовая подпись вместо количества (пока не используется)
  @BuiltValueField(wireName: r'label')
  String? get label;

  /// Ссылка для перехода на описание статуса (пока не используется)
  @BuiltValueField(wireName: r'link')
  String? get link;

  /// Доп. данные для уникальных случаев
  @BuiltValueField(wireName: r'extra')
  JsonObject? get extra;

  /// Датализация для \"составных\" статусов
  @BuiltValueField(wireName: r'subs')
  BuiltList<UserProfileBadge>? get subs;

  UserProfileBadge._();

  factory UserProfileBadge([void updates(UserProfileBadgeBuilder b)]) = _$UserProfileBadge;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserProfileBadgeBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserProfileBadge> get serializer => _$UserProfileBadgeSerializer();
}

class _$UserProfileBadgeSerializer implements PrimitiveSerializer<UserProfileBadge> {
  @override
  final Iterable<Type> types = const [UserProfileBadge, _$UserProfileBadge];

  @override
  final String wireName = r'UserProfileBadge';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserProfileBadge object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.group != null) {
      yield r'group';
      yield serializers.serialize(
        object.group,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'icon';
    yield object.icon == null ? null : serializers.serialize(
      object.icon,
      specifiedType: const FullType.nullable(String),
    );
    if (object.svg != null) {
      yield r'svg';
      yield serializers.serialize(
        object.svg,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.count != null) {
      yield r'count';
      yield serializers.serialize(
        object.count,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.label != null) {
      yield r'label';
      yield serializers.serialize(
        object.label,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.link != null) {
      yield r'link';
      yield serializers.serialize(
        object.link,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.extra != null) {
      yield r'extra';
      yield serializers.serialize(
        object.extra,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.subs != null) {
      yield r'subs';
      yield serializers.serialize(
        object.subs,
        specifiedType: const FullType.nullable(BuiltList, [FullType(UserProfileBadge)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserProfileBadge object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserProfileBadgeBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'group':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.group = valueDes;
          break;
        case r'icon':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.icon = valueDes;
          break;
        case r'svg':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.svg = valueDes;
          break;
        case r'count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.count = valueDes;
          break;
        case r'label':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.label = valueDes;
          break;
        case r'link':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.link = valueDes;
          break;
        case r'extra':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.extra = valueDes;
          break;
        case r'subs':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(UserProfileBadge)]),
          ) as BuiltList<UserProfileBadge>?;
          if (valueDes == null) continue;
          result.subs.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserProfileBadge deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserProfileBadgeBuilder();
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

