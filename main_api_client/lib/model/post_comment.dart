//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_comment.g.dart';

abstract class PostComment implements Built<PostComment, PostCommentBuilder> {
  @nullable
  @BuiltValueField(wireName: r'news_id')
  int get newsId;

  @nullable
  @BuiltValueField(wireName: r'parent_id')
  int get parentId;

  @nullable
  @BuiltValueField(wireName: r'text')
  String get text;

  // Boilerplate code needed to wire-up generated code
  PostComment._();

  static void _initializeBuilder(PostCommentBuilder b) => b;

  factory PostComment([void updates(PostCommentBuilder b)]) = _$PostComment;
  static Serializer<PostComment> get serializer => _$postCommentSerializer;
}
