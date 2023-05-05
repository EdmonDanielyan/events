//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'notification_full_list.g.dart';

abstract class NotificationFullList
    implements Built<NotificationFullList, NotificationFullListBuilder> {
  /// Список подписок на уведомления определённого типа. Подписки со значением \"по умолчанию\" не выводятся. Ключ - ID истоника уведомлений (напр. чата). Значение - состояние подписки. Значение с ключом \"_default\" - состояние по умолчанию для группы. Для чатов ключи: * просто число - ID группового чата * system - канал уведомлений * число с префиксом u - ID собеседника для приватного
  @nullable
  @BuiltValueField(wireName: r'chats')
  BuiltList<bool> get chats;

  // Boilerplate code needed to wire-up generated code
  NotificationFullList._();

  static void _initializeBuilder(NotificationFullListBuilder b) => b;

  factory NotificationFullList([void updates(NotificationFullListBuilder b)]) =
      _$NotificationFullList;
  static Serializer<NotificationFullList> get serializer =>
      _$notificationFullListSerializer;
}
