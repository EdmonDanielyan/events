//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_collection/built_collection.dart';
import 'package:main_api_client/model/organisation.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'organisation_directory_all_of.g.dart';

abstract class OrganisationDirectoryAllOf
    implements
        Built<OrganisationDirectoryAllOf, OrganisationDirectoryAllOfBuilder> {
  @nullable
  @BuiltValueField(wireName: r'items')
  BuiltList<Organisation> get items;

  // Boilerplate code needed to wire-up generated code
  OrganisationDirectoryAllOf._();

  static void _initializeBuilder(OrganisationDirectoryAllOfBuilder b) => b;

  factory OrganisationDirectoryAllOf(
          [void updates(OrganisationDirectoryAllOfBuilder b)]) =
      _$OrganisationDirectoryAllOf;
  static Serializer<OrganisationDirectoryAllOf> get serializer =>
      _$organisationDirectoryAllOfSerializer;
}
