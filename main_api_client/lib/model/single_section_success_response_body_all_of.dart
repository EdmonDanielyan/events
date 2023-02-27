//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/single_section_response_data.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'single_section_success_response_body_all_of.g.dart';

abstract class SingleSectionSuccessResponseBodyAllOf
    implements
        Built<SingleSectionSuccessResponseBodyAllOf,
            SingleSectionSuccessResponseBodyAllOfBuilder> {
  @nullable
  @BuiltValueField(wireName: r'data')
  SingleSectionResponseData get data;

  // Boilerplate code needed to wire-up generated code
  SingleSectionSuccessResponseBodyAllOf._();

  static void _initializeBuilder(
          SingleSectionSuccessResponseBodyAllOfBuilder b) =>
      b;

  factory SingleSectionSuccessResponseBodyAllOf(
          [void updates(SingleSectionSuccessResponseBodyAllOfBuilder b)]) =
      _$SingleSectionSuccessResponseBodyAllOf;
  static Serializer<SingleSectionSuccessResponseBodyAllOf> get serializer =>
      _$singleSectionSuccessResponseBodyAllOfSerializer;
}
