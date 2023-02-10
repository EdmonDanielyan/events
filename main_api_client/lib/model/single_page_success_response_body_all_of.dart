//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/single_page_response_data.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'single_page_success_response_body_all_of.g.dart';

abstract class SinglePageSuccessResponseBodyAllOf
    implements
        Built<SinglePageSuccessResponseBodyAllOf,
            SinglePageSuccessResponseBodyAllOfBuilder> {
  @nullable
  @BuiltValueField(wireName: r'data')
  SinglePageResponseData get data;

  // Boilerplate code needed to wire-up generated code
  SinglePageSuccessResponseBodyAllOf._();

  static void _initializeBuilder(SinglePageSuccessResponseBodyAllOfBuilder b) =>
      b;

  factory SinglePageSuccessResponseBodyAllOf(
          [void updates(SinglePageSuccessResponseBodyAllOfBuilder b)]) =
      _$SinglePageSuccessResponseBodyAllOf;
  static Serializer<SinglePageSuccessResponseBodyAllOf> get serializer =>
      _$singlePageSuccessResponseBodyAllOfSerializer;
}
