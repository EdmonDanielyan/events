//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/required_error.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'birthdays_not_found.g.dart';

abstract class BirthdaysNotFound
    implements Built<BirthdaysNotFound, BirthdaysNotFoundBuilder> {
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
  BirthdaysNotFound._();

  static void _initializeBuilder(BirthdaysNotFoundBuilder b) => b
    ..title = 'Дни рождения не найдены'
    ..status = 404
    ..code = 'QMA-32'
    ..success = false
    ..host = 'https://example.com'
    ..type = 'about:blank';

  factory BirthdaysNotFound([void updates(BirthdaysNotFoundBuilder b)]) =
      _$BirthdaysNotFound;
  static Serializer<BirthdaysNotFound> get serializer =>
      _$birthdaysNotFoundSerializer;
}
