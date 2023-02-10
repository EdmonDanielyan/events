//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'page_section.g.dart';

abstract class PageSection implements Built<PageSection, PageSectionBuilder> {
  @nullable
  @BuiltValueField(wireName: r'code')
  String get code;

  @nullable
  @BuiltValueField(wireName: r'name')
  String get name;

  // Boilerplate code needed to wire-up generated code
  PageSection._();

  static void _initializeBuilder(PageSectionBuilder b) => b;

  factory PageSection([void updates(PageSectionBuilder b)]) = _$PageSection;
  static Serializer<PageSection> get serializer => _$pageSectionSerializer;
}
