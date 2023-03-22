//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/required_error.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'not_event_member.g.dart';

abstract class NotEventMember
    implements Built<NotEventMember, NotEventMemberBuilder> {
  @nullable
  @BuiltValueField(wireName: r'title')
  String get title;

  @nullable
  @BuiltValueField(wireName: r'detail')
  String get detail;

  @nullable
  @BuiltValueField(wireName: r'status')
  int get status;

  @nullable
  @BuiltValueField(wireName: r'code')
  String get code;

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
  @BuiltValueField(wireName: r'type')
  String get type;

  @nullable
  @BuiltValueField(wireName: r'instance')
  String get instance;

  // Boilerplate code needed to wire-up generated code
  NotEventMember._();

  static void _initializeBuilder(NotEventMemberBuilder b) => b
    ..title = 'Текущий пользователь не участвует в этом событии'
    ..status = 400
    ..code = 'QMA-36'
    ..success = false
    ..host = 'https://example.com'
    ..type = 'about:blank';

  factory NotEventMember([void updates(NotEventMemberBuilder b)]) =
      _$NotEventMember;
  static Serializer<NotEventMember> get serializer =>
      _$notEventMemberSerializer;
}