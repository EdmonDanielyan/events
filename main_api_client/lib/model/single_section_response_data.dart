//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/page.dart';
import 'package:built_collection/built_collection.dart';
import 'package:main_api_client/model/page_section.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'single_section_response_data.g.dart';

abstract class SingleSectionResponseData
    implements
        Built<SingleSectionResponseData, SingleSectionResponseDataBuilder> {
  @nullable
  @BuiltValueField(wireName: r'section')
  PageSection get section;

  @nullable
  @BuiltValueField(wireName: r'pages')
  BuiltList<Page> get pages;

  // Boilerplate code needed to wire-up generated code
  SingleSectionResponseData._();

  static void _initializeBuilder(SingleSectionResponseDataBuilder b) => b;

  factory SingleSectionResponseData(
          [void updates(SingleSectionResponseDataBuilder b)]) =
      _$SingleSectionResponseData;
  static Serializer<SingleSectionResponseData> get serializer =>
      _$singleSectionResponseDataSerializer;
}
