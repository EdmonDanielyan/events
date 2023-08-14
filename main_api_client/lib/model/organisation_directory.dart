//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/organisation_directory_all_of.dart';
import 'package:built_collection/built_collection.dart';
import 'package:main_api_client/model/directory_meta_select.dart';
import 'package:main_api_client/model/organisation.dart';
import 'package:main_api_client/model/directory_meta.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'organisation_directory.g.dart';

abstract class OrganisationDirectory
    implements Built<OrganisationDirectory, OrganisationDirectoryBuilder> {
  @nullable
  @BuiltValueField(wireName: r'select')
  DirectoryMetaSelect get select;

  @nullable
  @BuiltValueField(wireName: r'items')
  BuiltList<Organisation> get items;

  // Boilerplate code needed to wire-up generated code
  OrganisationDirectory._();

  static void _initializeBuilder(OrganisationDirectoryBuilder b) => b;

  factory OrganisationDirectory(
      [void updates(OrganisationDirectoryBuilder b)]) = _$OrganisationDirectory;
  static Serializer<OrganisationDirectory> get serializer =>
      _$organisationDirectorySerializer;
}
