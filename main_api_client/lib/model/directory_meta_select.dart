//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'directory_meta_select.g.dart';

abstract class DirectoryMetaSelect
    implements Built<DirectoryMetaSelect, DirectoryMetaSelectBuilder> {
  /// Поле значения
  @nullable
  @BuiltValueField(wireName: r'valueField')
  num get valueField;

  /// Поле подписи
  @nullable
  @BuiltValueField(wireName: r'labelField')
  String get labelField;

  /// Родительский справочник
  @nullable
  @BuiltValueField(wireName: r'parentDirectory')
  String get parentDirectory;

  /// Поля с внешним ключом
  @nullable
  @BuiltValueField(wireName: r'parentKey')
  String get parentKey;

  // Boilerplate code needed to wire-up generated code
  DirectoryMetaSelect._();

  static void _initializeBuilder(DirectoryMetaSelectBuilder b) => b;

  factory DirectoryMetaSelect([void updates(DirectoryMetaSelectBuilder b)]) =
      _$DirectoryMetaSelect;
  static Serializer<DirectoryMetaSelect> get serializer =>
      _$directoryMetaSelectSerializer;
}
