//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'organisation.g.dart';

/// Organisation
///
/// Properties:
/// * [id] - ID
/// * [name] - Название
/// * [code] - Символьный код
/// * [sort] - Индекс сортировки
/// * [inn] - ИНН
/// * [zup] - ЗУП
/// * [link] - Ссылка на детальную информацию (на сайте)
/// * [hidden] - Скрыт в орг. структуре
/// * [dativeFio] - ФИО руководителя
/// * [dativePosition] - Должность руководителя
@BuiltValue()
abstract class Organisation implements Built<Organisation, OrganisationBuilder> {
  /// ID
  @BuiltValueField(wireName: r'id')
  num? get id;

  /// Название
  @BuiltValueField(wireName: r'name')
  String? get name;

  /// Символьный код
  @BuiltValueField(wireName: r'code')
  String? get code;

  /// Индекс сортировки
  @BuiltValueField(wireName: r'sort')
  String? get sort;

  /// ИНН
  @BuiltValueField(wireName: r'inn')
  String? get inn;

  /// ЗУП
  @BuiltValueField(wireName: r'zup')
  String? get zup;

  /// Ссылка на детальную информацию (на сайте)
  @BuiltValueField(wireName: r'link')
  String? get link;

  /// Скрыт в орг. структуре
  @BuiltValueField(wireName: r'hidden')
  bool? get hidden;

  /// ФИО руководителя
  @BuiltValueField(wireName: r'dativeFio')
  String? get dativeFio;

  /// Должность руководителя
  @BuiltValueField(wireName: r'dativePosition')
  String? get dativePosition;

  Organisation._();

  factory Organisation([void updates(OrganisationBuilder b)]) = _$Organisation;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OrganisationBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Organisation> get serializer => _$OrganisationSerializer();
}

class _$OrganisationSerializer implements PrimitiveSerializer<Organisation> {
  @override
  final Iterable<Type> types = const [Organisation, _$Organisation];

  @override
  final String wireName = r'Organisation';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Organisation object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(num),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
        specifiedType: const FullType(String),
      );
    }
    if (object.sort != null) {
      yield r'sort';
      yield serializers.serialize(
        object.sort,
        specifiedType: const FullType(String),
      );
    }
    if (object.inn != null) {
      yield r'inn';
      yield serializers.serialize(
        object.inn,
        specifiedType: const FullType(String),
      );
    }
    if (object.zup != null) {
      yield r'zup';
      yield serializers.serialize(
        object.zup,
        specifiedType: const FullType(String),
      );
    }
    if (object.link != null) {
      yield r'link';
      yield serializers.serialize(
        object.link,
        specifiedType: const FullType(String),
      );
    }
    if (object.hidden != null) {
      yield r'hidden';
      yield serializers.serialize(
        object.hidden,
        specifiedType: const FullType(bool),
      );
    }
    if (object.dativeFio != null) {
      yield r'dativeFio';
      yield serializers.serialize(
        object.dativeFio,
        specifiedType: const FullType(String),
      );
    }
    if (object.dativePosition != null) {
      yield r'dativePosition';
      yield serializers.serialize(
        object.dativePosition,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Organisation object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required OrganisationBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.id = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        case r'sort':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sort = valueDes;
          break;
        case r'inn':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.inn = valueDes;
          break;
        case r'zup':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.zup = valueDes;
          break;
        case r'link':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.link = valueDes;
          break;
        case r'hidden':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.hidden = valueDes;
          break;
        case r'dativeFio':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.dativeFio = valueDes;
          break;
        case r'dativePosition':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.dativePosition = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Organisation deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OrganisationBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

