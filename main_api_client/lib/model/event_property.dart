//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'event_property.g.dart';

abstract class EventProperty
    implements Built<EventProperty, EventPropertyBuilder> {
  @nullable
  @BuiltValueField(wireName: r'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: r'title')
  String get title;

  @nullable
  @BuiltValueField(wireName: r'date_create')
  DateTime get dateCreate;

  @nullable
  @BuiltValueField(wireName: r'date_start')
  DateTime get dateStart;

  @nullable
  @BuiltValueField(wireName: r'date_finish')
  DateTime get dateFinish;

  @nullable
  @BuiltValueField(wireName: r'place')
  String get place;

  @nullable
  @BuiltValueField(wireName: r'view_count')
  int get viewCount;

  @nullable
  @BuiltValueField(wireName: r'detail_text')
  String get detailText;

  @nullable
  @BuiltValueField(wireName: r'detail_picture')
  String get detailPicture;

  @nullable
  @BuiltValueField(wireName: r'is_member')
  bool get isMember;

  @nullable
  @BuiltValueField(wireName: r'is_actual')
  bool get isActual;

  @nullable
  @BuiltValueField(wireName: r'places_available')
  bool get placesAvailable;

  // Boilerplate code needed to wire-up generated code
  EventProperty._();

  static void _initializeBuilder(EventPropertyBuilder b) => b
    ..detailText = 'null'
    ..detailPicture = 'null'
    ..isMember = false
    ..isActual = false
    ..placesAvailable = false;

  factory EventProperty([void updates(EventPropertyBuilder b)]) =
      _$EventProperty;
  static Serializer<EventProperty> get serializer => _$eventPropertySerializer;
}
