//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/notification_sub_state.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'single_notification_config_result_body_all_of.g.dart';

abstract class SingleNotificationConfigResultBodyAllOf
    implements
        Built<SingleNotificationConfigResultBodyAllOf,
            SingleNotificationConfigResultBodyAllOfBuilder> {
  @nullable
  @BuiltValueField(wireName: r'data')
  NotificationSubState get data;

  // Boilerplate code needed to wire-up generated code
  SingleNotificationConfigResultBodyAllOf._();

  static void _initializeBuilder(
          SingleNotificationConfigResultBodyAllOfBuilder b) =>
      b;

  factory SingleNotificationConfigResultBodyAllOf(
          [void updates(SingleNotificationConfigResultBodyAllOfBuilder b)]) =
      _$SingleNotificationConfigResultBodyAllOf;
  static Serializer<SingleNotificationConfigResultBodyAllOf> get serializer =>
      _$singleNotificationConfigResultBodyAllOfSerializer;
}
