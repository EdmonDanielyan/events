//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_collection/built_collection.dart';
import 'package:main_api_client/model/page_section.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'list_section_response_data.g.dart';

abstract class ListSectionResponseData
    implements Built<ListSectionResponseData, ListSectionResponseDataBuilder> {
  @nullable
  @BuiltValueField(wireName: r'sections')
  BuiltList<PageSection> get sections;

  // Boilerplate code needed to wire-up generated code
  ListSectionResponseData._();

  static void _initializeBuilder(ListSectionResponseDataBuilder b) => b;

  factory ListSectionResponseData(
          [void updates(ListSectionResponseDataBuilder b)]) =
      _$ListSectionResponseData;
  static Serializer<ListSectionResponseData> get serializer =>
      _$listSectionResponseDataSerializer;
}
