//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'notification_sub_state.g.dart';

abstract class NotificationSubState
    implements Built<NotificationSubState, NotificationSubStateBuilder> {
  /// TRUE - подписан. FALSE - не подписан. NULL - по умолчанию.
  @nullable
  @BuiltValueField(wireName: r'value')
  bool get value;

  // Boilerplate code needed to wire-up generated code
  NotificationSubState._();

  static void _initializeBuilder(NotificationSubStateBuilder b) => b;

  factory NotificationSubState([void updates(NotificationSubStateBuilder b)]) =
      _$NotificationSubState;
  static Serializer<NotificationSubState> get serializer =>
      _$notificationSubStateSerializer;
}
