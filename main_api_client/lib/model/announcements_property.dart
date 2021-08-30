//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'announcements_property.g.dart';

abstract class AnnouncementsProperty
    implements Built<AnnouncementsProperty, AnnouncementsPropertyBuilder> {
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

  // Boilerplate code needed to wire-up generated code
  AnnouncementsProperty._();

  static void _initializeBuilder(AnnouncementsPropertyBuilder b) => b;

  factory AnnouncementsProperty(
      [void updates(AnnouncementsPropertyBuilder b)]) = _$AnnouncementsProperty;
  static Serializer<AnnouncementsProperty> get serializer =>
      _$announcementsPropertySerializer;
}
