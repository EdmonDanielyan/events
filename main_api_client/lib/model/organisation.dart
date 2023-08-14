//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'organisation.g.dart';

abstract class Organisation
    implements Built<Organisation, OrganisationBuilder> {
  /// ID
  @nullable
  @BuiltValueField(wireName: r'id')
  num get id;

  /// Название
  @nullable
  @BuiltValueField(wireName: r'name')
  String get name;

  /// Символьный код
  @nullable
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Индекс сортировки
  @nullable
  @BuiltValueField(wireName: r'sort')
  String get sort;

  /// ИНН
  @nullable
  @BuiltValueField(wireName: r'inn')
  String get inn;

  /// ЗУП
  @nullable
  @BuiltValueField(wireName: r'zup')
  String get zup;

  /// Ссылка на детальную информацию (на сайте)
  @nullable
  @BuiltValueField(wireName: r'link')
  String get link;

  /// Скрыт в орг. структуре
  @nullable
  @BuiltValueField(wireName: r'hidden')
  bool get hidden;

  /// ФИО руководителя
  @nullable
  @BuiltValueField(wireName: r'dativeFio')
  String get dativeFio;

  /// Должность руководителя
  @nullable
  @BuiltValueField(wireName: r'dativePosition')
  String get dativePosition;

  // Boilerplate code needed to wire-up generated code
  Organisation._();

  static void _initializeBuilder(OrganisationBuilder b) => b;

  factory Organisation([void updates(OrganisationBuilder b)]) = _$Organisation;
  static Serializer<Organisation> get serializer => _$organisationSerializer;
}
