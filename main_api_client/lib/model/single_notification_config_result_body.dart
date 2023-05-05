//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/single_notification_config_result_body_all_of.dart';
import 'package:main_api_client/model/notification_sub_state.dart';
import 'package:main_api_client/model/required_success.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'single_notification_config_result_body.g.dart';

abstract class SingleNotificationConfigResultBody
    implements
        Built<SingleNotificationConfigResultBody,
            SingleNotificationConfigResultBodyBuilder> {
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
  NotificationSubState get data;

  // Boilerplate code needed to wire-up generated code
  SingleNotificationConfigResultBody._();

  static void _initializeBuilder(SingleNotificationConfigResultBodyBuilder b) =>
      b
        ..success = true
        ..host = 'https://example.com'
        ..version = '1.0.0'
        ..status = 200;

  factory SingleNotificationConfigResultBody(
          [void updates(SingleNotificationConfigResultBodyBuilder b)]) =
      _$SingleNotificationConfigResultBody;
  static Serializer<SingleNotificationConfigResultBody> get serializer =>
      _$singleNotificationConfigResultBodySerializer;
}
