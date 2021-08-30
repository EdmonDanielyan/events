//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'publications_property.g.dart';

abstract class PublicationsProperty
    implements Built<PublicationsProperty, PublicationsPropertyBuilder> {
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
  @BuiltValueField(wireName: r'votes')
  int get votes;

  // Boilerplate code needed to wire-up generated code
  PublicationsProperty._();

  static void _initializeBuilder(PublicationsPropertyBuilder b) => b;

  factory PublicationsProperty([void updates(PublicationsPropertyBuilder b)]) =
      _$PublicationsProperty;
  static Serializer<PublicationsProperty> get serializer =>
      _$publicationsPropertySerializer;
}
