//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_collection/built_collection.dart';
import 'package:main_api_client/model/snippet.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'snippet_list_response_data.g.dart';

abstract class SnippetListResponseData
    implements Built<SnippetListResponseData, SnippetListResponseDataBuilder> {
  @nullable
  @BuiltValueField(wireName: r'snippets')
  BuiltList<Snippet> get snippets;

  // Boilerplate code needed to wire-up generated code
  SnippetListResponseData._();

  static void _initializeBuilder(SnippetListResponseDataBuilder b) => b;

  factory SnippetListResponseData(
          [void updates(SnippetListResponseDataBuilder b)]) =
      _$SnippetListResponseData;
  static Serializer<SnippetListResponseData> get serializer =>
      _$snippetListResponseDataSerializer;
}
