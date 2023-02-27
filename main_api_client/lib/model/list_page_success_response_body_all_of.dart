//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/list_page_response_data.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'list_page_success_response_body_all_of.g.dart';

abstract class ListPageSuccessResponseBodyAllOf
    implements
        Built<ListPageSuccessResponseBodyAllOf,
            ListPageSuccessResponseBodyAllOfBuilder> {
  @nullable
  @BuiltValueField(wireName: r'data')
  ListPageResponseData get data;

  // Boilerplate code needed to wire-up generated code
  ListPageSuccessResponseBodyAllOf._();

  static void _initializeBuilder(ListPageSuccessResponseBodyAllOfBuilder b) =>
      b;

  factory ListPageSuccessResponseBodyAllOf(
          [void updates(ListPageSuccessResponseBodyAllOfBuilder b)]) =
      _$ListPageSuccessResponseBodyAllOf;
  static Serializer<ListPageSuccessResponseBodyAllOf> get serializer =>
      _$listPageSuccessResponseBodyAllOfSerializer;
}
