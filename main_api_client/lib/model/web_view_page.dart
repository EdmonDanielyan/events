//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'web_view_page.g.dart';

abstract class WebViewPage implements Built<WebViewPage, WebViewPageBuilder> {
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
  @BuiltValueField(wireName: r'url')
  String get url;

  @nullable
  @BuiltValueField(wireName: r'iconUrl')
  String get iconUrl;

  // Boilerplate code needed to wire-up generated code
  WebViewPage._();

  static void _initializeBuilder(WebViewPageBuilder b) => b;

  factory WebViewPage([void updates(WebViewPageBuilder b)]) = _$WebViewPage;
  static Serializer<WebViewPage> get serializer => _$webViewPageSerializer;
}
