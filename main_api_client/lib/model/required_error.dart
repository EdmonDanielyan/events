//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'required_error.g.dart';

abstract class RequiredError
    implements Built<RequiredError, RequiredErrorBuilder> {
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
  RequiredError._();

  static void _initializeBuilder(RequiredErrorBuilder b) => b
    ..success = false
    ..host = 'https://example.com'
    ..type = 'about:blank';

  factory RequiredError([void updates(RequiredErrorBuilder b)]) =
      _$RequiredError;
  static Serializer<RequiredError> get serializer => _$requiredErrorSerializer;
}
