//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/required_error.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'server_error.g.dart';

abstract class ServerError implements Built<ServerError, ServerErrorBuilder> {
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
  ServerError._();

  static void _initializeBuilder(ServerErrorBuilder b) => b
    ..status = 500
    ..code = 'QMA-#'
    ..success = false
    ..host = 'https://example.com'
    ..type = 'about:blank';

  factory ServerError([void updates(ServerErrorBuilder b)]) = _$ServerError;
  static Serializer<ServerError> get serializer => _$serverErrorSerializer;
}
