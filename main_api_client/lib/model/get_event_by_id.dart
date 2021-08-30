//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/event_property.dart';
import 'package:main_api_client/model/required_success.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_event_by_id.g.dart';

abstract class GetEventById
    implements Built<GetEventById, GetEventByIdBuilder> {
  @nullable
  @BuiltValueField(wireName: r'data')
  EventProperty get data;

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
  GetEventById._();

  static void _initializeBuilder(GetEventByIdBuilder b) => b
    ..success = true
    ..host = 'https://example.com'
    ..version = '1.0.0'
    ..status = 200;

  factory GetEventById([void updates(GetEventByIdBuilder b)]) = _$GetEventById;
  static Serializer<GetEventById> get serializer => _$getEventByIdSerializer;
}
