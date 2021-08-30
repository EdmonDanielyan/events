//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/movements_object.dart';
import 'package:built_collection/built_collection.dart';
import 'package:main_api_client/model/required_success.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'movements_success.g.dart';

abstract class MovementsSuccess
    implements Built<MovementsSuccess, MovementsSuccessBuilder> {
  @nullable
  @BuiltValueField(wireName: r'data')
  BuiltList<MovementsObject> get data;

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

  // Boilerplate code needed to wire-up generated code
  MovementsSuccess._();

  static void _initializeBuilder(MovementsSuccessBuilder b) => b
    ..success = true
    ..host = 'https://example.com'
    ..version = '1.0.0'
    ..status = 200;

  factory MovementsSuccess([void updates(MovementsSuccessBuilder b)]) =
      _$MovementsSuccess;
  static Serializer<MovementsSuccess> get serializer =>
      _$movementsSuccessSerializer;
}
