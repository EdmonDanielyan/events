//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'questions_list_data.g.dart';

abstract class QuestionsListData
    implements Built<QuestionsListData, QuestionsListDataBuilder> {
  @nullable
  @BuiltValueField(wireName: r'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: r'date')
  String get date;

  @nullable
  @BuiltValueField(wireName: r'responsible')
  String get responsible;

  @nullable
  @BuiltValueField(wireName: r'tags')
  String get tags;

  @nullable
  @BuiltValueField(wireName: r'question')
  String get question;

  @nullable
  @BuiltValueField(wireName: r'answer')
  String get answer;

  @nullable
  @BuiltValueField(wireName: r'total_count')
  int get totalCount;

  @nullable
  @BuiltValueField(wireName: r'next')
  String get next;

  @nullable
  @BuiltValueField(wireName: r'prev')
  String get prev;

  // Boilerplate code needed to wire-up generated code
  QuestionsListData._();

  static void _initializeBuilder(QuestionsListDataBuilder b) => b;

  factory QuestionsListData([void updates(QuestionsListDataBuilder b)]) =
      _$QuestionsListData;
  static Serializer<QuestionsListData> get serializer =>
      _$questionsListDataSerializer;
}
