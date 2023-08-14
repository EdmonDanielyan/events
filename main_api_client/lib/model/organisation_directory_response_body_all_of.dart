//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/organisation_directory.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'organisation_directory_response_body_all_of.g.dart';

abstract class OrganisationDirectoryResponseBodyAllOf
    implements
        Built<OrganisationDirectoryResponseBodyAllOf,
            OrganisationDirectoryResponseBodyAllOfBuilder> {
  @nullable
  @BuiltValueField(wireName: r'data')
  OrganisationDirectory get data;

  // Boilerplate code needed to wire-up generated code
  OrganisationDirectoryResponseBodyAllOf._();

  static void _initializeBuilder(
          OrganisationDirectoryResponseBodyAllOfBuilder b) =>
      b;

  factory OrganisationDirectoryResponseBodyAllOf(
          [void updates(OrganisationDirectoryResponseBodyAllOfBuilder b)]) =
      _$OrganisationDirectoryResponseBodyAllOf;
  static Serializer<OrganisationDirectoryResponseBodyAllOf> get serializer =>
      _$organisationDirectoryResponseBodyAllOfSerializer;
}
