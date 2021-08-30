//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'comment.g.dart';

abstract class Comment implements Built<Comment, CommentBuilder> {
  @nullable
  @BuiltValueField(wireName: r'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: r'date_create')
  DateTime get dateCreate;

  @nullable
  @BuiltValueField(wireName: r'author_id')
  int get authorId;

  @nullable
  @BuiltValueField(wireName: r'post_id')
  int get postId;

  @nullable
  @BuiltValueField(wireName: r'post_text')
  String get postText;

  @nullable
  @BuiltValueField(wireName: r'user_name')
  String get userName;

  @nullable
  @BuiltValueField(wireName: r'user_last_name')
  String get userLastName;

  @nullable
  @BuiltValueField(wireName: r'likes')
  int get likes;

  @nullable
  @BuiltValueField(wireName: r'liked_by_user')
  bool get likedByUser;

  @nullable
  @BuiltValueField(wireName: r'avatar')
  String get avatar;

  // Boilerplate code needed to wire-up generated code
  Comment._();

  static void _initializeBuilder(CommentBuilder b) => b;

  factory Comment([void updates(CommentBuilder b)]) = _$Comment;
  static Serializer<Comment> get serializer => _$commentSerializer;
}
