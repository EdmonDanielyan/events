//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/list_section_response_data.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'list_section_success_response_body_all_of.g.dart';

abstract class ListSectionSuccessResponseBodyAllOf
    implements
        Built<ListSectionSuccessResponseBodyAllOf,
            ListSectionSuccessResponseBodyAllOfBuilder> {
  @nullable
  @BuiltValueField(wireName: r'data')
  ListSectionResponseData get data;

  // Boilerplate code needed to wire-up generated code
  ListSectionSuccessResponseBodyAllOf._();

  static void _initializeBuilder(
          ListSectionSuccessResponseBodyAllOfBuilder b) =>
      b;

  factory ListSectionSuccessResponseBodyAllOf(
          [void updates(ListSectionSuccessResponseBodyAllOfBuilder b)]) =
      _$ListSectionSuccessResponseBodyAllOf;
  static Serializer<ListSectionSuccessResponseBodyAllOf> get serializer =>
      _$listSectionSuccessResponseBodyAllOfSerializer;
}
