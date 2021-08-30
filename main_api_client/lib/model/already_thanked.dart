//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/required_error.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'already_thanked.g.dart';

abstract class AlreadyThanked
    implements Built<AlreadyThanked, AlreadyThankedBuilder> {
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
  AlreadyThanked._();

  static void _initializeBuilder(AlreadyThankedBuilder b) => b
    ..success = false
    ..host = 'https://example.com'
    ..type = 'about:blank';

  factory AlreadyThanked([void updates(AlreadyThankedBuilder b)]) =
      _$AlreadyThanked;
  static Serializer<AlreadyThanked> get serializer =>
      _$alreadyThankedSerializer;
}
