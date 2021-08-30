//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'announcement_property.g.dart';

abstract class AnnouncementProperty
    implements Built<AnnouncementProperty, AnnouncementPropertyBuilder> {
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
  @BuiltValueField(wireName: r'view_count')
  int get viewCount;

  @nullable
  @BuiltValueField(wireName: r'detail_text')
  String get detailText;

  // Boilerplate code needed to wire-up generated code
  AnnouncementProperty._();

  static void _initializeBuilder(AnnouncementPropertyBuilder b) =>
      b..detailText = 'null';

  factory AnnouncementProperty([void updates(AnnouncementPropertyBuilder b)]) =
      _$AnnouncementProperty;
  static Serializer<AnnouncementProperty> get serializer =>
      _$announcementPropertySerializer;
}
