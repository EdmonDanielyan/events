//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'news_property_by_id.g.dart';

abstract class NewsPropertyById
    implements Built<NewsPropertyById, NewsPropertyByIdBuilder> {
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
  @BuiltValueField(wireName: r'comment_count')
  int get commentCount;

  @nullable
  @BuiltValueField(wireName: r'view_count')
  int get viewCount;

  @nullable
  @BuiltValueField(wireName: r'like_count')
  int get likeCount;

  @nullable
  @BuiltValueField(wireName: r'detail_text')
  String get detailText;

  @nullable
  @BuiltValueField(wireName: r'image_links')
  BuiltList<String> get imageLinks;

  @nullable
  @BuiltValueField(wireName: r'video_links')
  BuiltList<String> get videoLinks;

  @nullable
  @BuiltValueField(wireName: r'liked')
  bool get liked;

  // Boilerplate code needed to wire-up generated code
  NewsPropertyById._();

  static void _initializeBuilder(NewsPropertyByIdBuilder b) => b;

  factory NewsPropertyById([void updates(NewsPropertyByIdBuilder b)]) =
      _$NewsPropertyById;
  static Serializer<NewsPropertyById> get serializer =>
      _$newsPropertyByIdSerializer;
}
