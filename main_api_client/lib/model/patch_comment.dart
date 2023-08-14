//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'patch_comment.g.dart';

abstract class PatchComment
    implements Built<PatchComment, PatchCommentBuilder> {
  @nullable
  @BuiltValueField(wireName: r'text')
  String get text;

  // Boilerplate code needed to wire-up generated code
  PatchComment._();

  static void _initializeBuilder(PatchCommentBuilder b) => b;

  factory PatchComment([void updates(PatchCommentBuilder b)]) = _$PatchComment;
  static Serializer<PatchComment> get serializer => _$patchCommentSerializer;
}
