//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/directory_meta_select.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'directory_meta.g.dart';

abstract class DirectoryMeta
    implements Built<DirectoryMeta, DirectoryMetaBuilder> {
  @nullable
  @BuiltValueField(wireName: r'select')
  DirectoryMetaSelect get select;

  // Boilerplate code needed to wire-up generated code
  DirectoryMeta._();

  static void _initializeBuilder(DirectoryMetaBuilder b) => b;

  factory DirectoryMeta([void updates(DirectoryMetaBuilder b)]) =
      _$DirectoryMeta;
  static Serializer<DirectoryMeta> get serializer => _$directoryMetaSerializer;
}
