//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/notification_full_list.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'all_notifications_config_result_body_all_of.g.dart';

abstract class AllNotificationsConfigResultBodyAllOf
    implements
        Built<AllNotificationsConfigResultBodyAllOf,
            AllNotificationsConfigResultBodyAllOfBuilder> {
  @nullable
  @BuiltValueField(wireName: r'data')
  NotificationFullList get data;

  // Boilerplate code needed to wire-up generated code
  AllNotificationsConfigResultBodyAllOf._();

  static void _initializeBuilder(
          AllNotificationsConfigResultBodyAllOfBuilder b) =>
      b;

  factory AllNotificationsConfigResultBodyAllOf(
          [void updates(AllNotificationsConfigResultBodyAllOfBuilder b)]) =
      _$AllNotificationsConfigResultBodyAllOf;
  static Serializer<AllNotificationsConfigResultBodyAllOf> get serializer =>
      _$allNotificationsConfigResultBodyAllOfSerializer;
}
