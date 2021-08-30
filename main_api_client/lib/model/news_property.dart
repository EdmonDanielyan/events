//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'news_property.g.dart';

abstract class NewsProperty
    implements Built<NewsProperty, NewsPropertyBuilder> {
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
  @BuiltValueField(wireName: r'comment_count')
  int get commentCount;

  @nullable
  @BuiltValueField(wireName: r'like_count')
  int get likeCount;

  @nullable
  @BuiltValueField(wireName: r'preview_picture')
  String get previewPicture;

  @nullable
  @BuiltValueField(wireName: r'liked')
  bool get liked;

  // Boilerplate code needed to wire-up generated code
  NewsProperty._();

  static void _initializeBuilder(NewsPropertyBuilder b) =>
      b..previewPicture = 'null';

  factory NewsProperty([void updates(NewsPropertyBuilder b)]) = _$NewsProperty;
  static Serializer<NewsProperty> get serializer => _$newsPropertySerializer;
}
