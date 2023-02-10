//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/page.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'single_page_response_data.g.dart';

abstract class SinglePageResponseData
    implements Built<SinglePageResponseData, SinglePageResponseDataBuilder> {
  @nullable
  @BuiltValueField(wireName: r'page')
  Page get page;

  // Boilerplate code needed to wire-up generated code
  SinglePageResponseData._();

  static void _initializeBuilder(SinglePageResponseDataBuilder b) => b;

  factory SinglePageResponseData(
          [void updates(SinglePageResponseDataBuilder b)]) =
      _$SinglePageResponseData;
  static Serializer<SinglePageResponseData> get serializer =>
      _$singlePageResponseDataSerializer;
}
