//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'news_tab.g.dart';

abstract class NewsTab implements Built<NewsTab, NewsTabBuilder> {
  /// Символьный код для последующего запроса фильтрованных результатов
  @nullable
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Отображаемое название
  @nullable
  @BuiltValueField(wireName: r'title')
  String get title;

  /// Отображать ли в списке табов.
  @nullable
  @BuiltValueField(wireName: r'visible')
  bool get visible;

  /// Количество непрочитанных записей (зарезервировано, пока не реализовано).
  @nullable
  @BuiltValueField(wireName: r'new')
  int get new_;

  // Boilerplate code needed to wire-up generated code
  NewsTab._();

  static void _initializeBuilder(NewsTabBuilder b) => b;

  factory NewsTab([void updates(NewsTabBuilder b)]) = _$NewsTab;
  static Serializer<NewsTab> get serializer => _$newsTabSerializer;
}
