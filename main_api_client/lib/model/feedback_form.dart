//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'feedback_form.g.dart';

abstract class FeedbackForm
    implements Built<FeedbackForm, FeedbackFormBuilder> {
  @nullable
  @BuiltValueField(wireName: r'id')
  String get id;

  @nullable
  @BuiltValueField(wireName: r'title')
  String get title;

  // Boilerplate code needed to wire-up generated code
  FeedbackForm._();

  static void _initializeBuilder(FeedbackFormBuilder b) => b;

  factory FeedbackForm([void updates(FeedbackFormBuilder b)]) = _$FeedbackForm;
  static Serializer<FeedbackForm> get serializer => _$feedbackFormSerializer;
}
