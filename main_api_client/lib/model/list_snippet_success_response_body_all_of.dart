//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/snippet_list_response_data.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'list_snippet_success_response_body_all_of.g.dart';

abstract class ListSnippetSuccessResponseBodyAllOf
    implements
        Built<ListSnippetSuccessResponseBodyAllOf,
            ListSnippetSuccessResponseBodyAllOfBuilder> {
  @nullable
  @BuiltValueField(wireName: r'data')
  SnippetListResponseData get data;

  // Boilerplate code needed to wire-up generated code
  ListSnippetSuccessResponseBodyAllOf._();

  static void _initializeBuilder(
          ListSnippetSuccessResponseBodyAllOfBuilder b) =>
      b;

  factory ListSnippetSuccessResponseBodyAllOf(
          [void updates(ListSnippetSuccessResponseBodyAllOfBuilder b)]) =
      _$ListSnippetSuccessResponseBodyAllOf;
  static Serializer<ListSnippetSuccessResponseBodyAllOf> get serializer =>
      _$listSnippetSuccessResponseBodyAllOfSerializer;
}
