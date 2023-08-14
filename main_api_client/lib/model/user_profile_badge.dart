//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_profile_badge.g.dart';

abstract class UserProfileBadge
    implements Built<UserProfileBadge, UserProfileBadgeBuilder> {
  /// Символьный код (ниже первого уровня не уникальный)
  @nullable
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Название
  @nullable
  @BuiltValueField(wireName: r'name')
  String get name;

  /// Группа (например на доске почёта награды разбиты по категориям)
  @nullable
  @BuiltValueField(wireName: r'group')
  String get group;

  /// Имя ассета иконки
  @nullable
  @BuiltValueField(wireName: r'icon')
  String get icon;

  /// Полный код иконки в svg. Используется, если поле icon не задано.
  @nullable
  @BuiltValueField(wireName: r'svg')
  String get svg;

  /// Количество, если задано отображается рябом с бейджем
  @nullable
  @BuiltValueField(wireName: r'count')
  num get count;

  /// Короткая текстовая подпись вместо количества (пока не используется)
  @nullable
  @BuiltValueField(wireName: r'label')
  String get label;

  /// Ссылка для перехода на описание статуса (пока не используется)
  @nullable
  @BuiltValueField(wireName: r'link')
  String get link;

  /// Доп. данные для уникальных случаев
  @nullable
  @BuiltValueField(wireName: r'extra')
  JsonObject get extra;

  /// Датализация для \"составных\" статусов
  @nullable
  @BuiltValueField(wireName: r'subs')
  BuiltList<UserProfileBadge> get subs;

  // Boilerplate code needed to wire-up generated code
  UserProfileBadge._();

  static void _initializeBuilder(UserProfileBadgeBuilder b) => b;

  factory UserProfileBadge([void updates(UserProfileBadgeBuilder b)]) =
      _$UserProfileBadge;
  static Serializer<UserProfileBadge> get serializer =>
      _$userProfileBadgeSerializer;
}
