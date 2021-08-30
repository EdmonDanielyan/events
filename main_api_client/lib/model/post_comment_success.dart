//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/required_success.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_comment_success.g.dart';

abstract class PostCommentSuccess
    implements Built<PostCommentSuccess, PostCommentSuccessBuilder> {
  @nullable
  @BuiltValueField(wireName: r'data')
  JsonObject get data;

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
  PostCommentSuccess._();

  static void _initializeBuilder(PostCommentSuccessBuilder b) => b
    ..success = true
    ..host = 'https://example.com'
    ..version = '1.0.0'
    ..status = 200;

  factory PostCommentSuccess([void updates(PostCommentSuccessBuilder b)]) =
      _$PostCommentSuccess;
  static Serializer<PostCommentSuccess> get serializer =>
      _$postCommentSuccessSerializer;
}
