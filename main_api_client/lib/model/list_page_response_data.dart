//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/page.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'list_page_response_data.g.dart';

abstract class ListPageResponseData
    implements Built<ListPageResponseData, ListPageResponseDataBuilder> {
  @nullable
  @BuiltValueField(wireName: r'pages')
  BuiltList<Page> get pages;

  // Boilerplate code needed to wire-up generated code
  ListPageResponseData._();

  static void _initializeBuilder(ListPageResponseDataBuilder b) => b;

  factory ListPageResponseData([void updates(ListPageResponseDataBuilder b)]) =
      _$ListPageResponseData;
  static Serializer<ListPageResponseData> get serializer =>
      _$listPageResponseDataSerializer;
}
