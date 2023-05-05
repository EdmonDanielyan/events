//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/all_notifications_config_result_body_all_of.dart';
import 'package:main_api_client/model/required_success.dart';
import 'package:main_api_client/model/notification_full_list.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'all_notifications_config_result_body.g.dart';

abstract class AllNotificationsConfigResultBody
    implements
        Built<AllNotificationsConfigResultBody,
            AllNotificationsConfigResultBodyBuilder> {
  @nullable
  @BuiltValueField(wireName: r'success')
  bool get success;

  @nullable
  @BuiltValueField(wireName: r'host')
  String get host;

  @nullable
  @BuiltValueField(wireName: r'version')
  String get version;

  @nullable
  @BuiltValueField(wireName: r'returned')
  DateTime get returned;

  @nullable
  @BuiltValueField(wireName: r'status')
  int get status;

  @nullable
  @BuiltValueField(wireName: r'data')
  NotificationFullList get data;

  // Boilerplate code needed to wire-up generated code
  AllNotificationsConfigResultBody._();

  static void _initializeBuilder(AllNotificationsConfigResultBodyBuilder b) => b
    ..success = true
    ..host = 'https://example.com'
    ..version = '1.0.0'
    ..status = 200;

  factory AllNotificationsConfigResultBody(
          [void updates(AllNotificationsConfigResultBodyBuilder b)]) =
      _$AllNotificationsConfigResultBody;
  static Serializer<AllNotificationsConfigResultBody> get serializer =>
      _$allNotificationsConfigResultBodySerializer;
}