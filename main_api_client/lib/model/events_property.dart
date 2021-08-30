//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'events_property.g.dart';

abstract class EventsProperty
    implements Built<EventsProperty, EventsPropertyBuilder> {
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
  @BuiltValueField(wireName: r'preview_picture')
  String get previewPicture;

  // Boilerplate code needed to wire-up generated code
  EventsProperty._();

  static void _initializeBuilder(EventsPropertyBuilder b) =>
      b..previewPicture = 'null';

  factory EventsProperty([void updates(EventsPropertyBuilder b)]) =
      _$EventsProperty;
  static Serializer<EventsProperty> get serializer =>
      _$eventsPropertySerializer;
}
