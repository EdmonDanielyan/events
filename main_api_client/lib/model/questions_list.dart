//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_collection/built_collection.dart';
import 'package:main_api_client/model/required_success.dart';
import 'package:main_api_client/model/questions_list_data.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'questions_list.g.dart';

abstract class QuestionsList
    implements Built<QuestionsList, QuestionsListBuilder> {
  @nullable
  @BuiltValueField(wireName: r'data')
  BuiltList<QuestionsListData> get data;

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
  QuestionsList._();

  static void _initializeBuilder(QuestionsListBuilder b) => b
    ..success = true
    ..host = 'https://example.com'
    ..version = '1.0.0'
    ..status = 200;

  factory QuestionsList([void updates(QuestionsListBuilder b)]) =
      _$QuestionsList;
  static Serializer<QuestionsList> get serializer => _$questionsListSerializer;
}
