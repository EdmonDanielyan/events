//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_collection/built_collection.dart';
import 'package:main_api_client/model/comment_parent.dart';
import 'package:main_api_client/model/required_success.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_comments_by_id.g.dart';

abstract class GetCommentsById
    implements Built<GetCommentsById, GetCommentsByIdBuilder> {
  @nullable
  @BuiltValueField(wireName: r'data')
  BuiltList<CommentParent> get data;

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
  GetCommentsById._();

  static void _initializeBuilder(GetCommentsByIdBuilder b) => b
    ..success = true
    ..host = 'https://example.com'
    ..version = '1.0.0'
    ..status = 200;

  factory GetCommentsById([void updates(GetCommentsByIdBuilder b)]) =
      _$GetCommentsById;
  static Serializer<GetCommentsById> get serializer =>
      _$getCommentsByIdSerializer;
}
