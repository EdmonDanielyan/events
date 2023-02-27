//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/text_page.dart';
import 'package:main_api_client/model/web_view_page.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'page.g.dart';

abstract class Page implements Built<Page, PageBuilder> {
  @nullable
  @BuiltValueField(wireName: r'type')
  String get type;

  @nullable
  @BuiltValueField(wireName: r'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: r'code')
  String get code;

  @nullable
  @BuiltValueField(wireName: r'name')
  String get name;

  @nullable
  @BuiltValueField(wireName: r'preview')
  String get preview;

  @nullable
  @BuiltValueField(wireName: r'detail')
  String get detail;

  @nullable
  @BuiltValueField(wireName: r'url')
  String get url;

  // Boilerplate code needed to wire-up generated code
  Page._();

  static void _initializeBuilder(PageBuilder b) => b;

  factory Page([void updates(PageBuilder b)]) = _$Page;
  static Serializer<Page> get serializer => _$pageSerializer;
}
