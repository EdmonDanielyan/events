//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'directory_meta_select.g.dart';

/// Параметры по умолчанию для отображения в списках выбора
///
/// Properties:
/// * [valueField] - Поле значения
/// * [labelField] - Поле подписи
/// * [parentDirectory] - Родительский справочник
/// * [parentKey] - Поля с внешним ключом
@BuiltValue()
abstract class DirectoryMetaSelect implements Built<DirectoryMetaSelect, DirectoryMetaSelectBuilder> {
  /// Поле значения
  @BuiltValueField(wireName: r'valueField')
  num? get valueField;

  /// Поле подписи
  @BuiltValueField(wireName: r'labelField')
  String? get labelField;

  /// Родительский справочник
  @BuiltValueField(wireName: r'parentDirectory')
  String? get parentDirectory;

  /// Поля с внешним ключом
  @BuiltValueField(wireName: r'parentKey')
  String? get parentKey;

  DirectoryMetaSelect._();

  factory DirectoryMetaSelect([void updates(DirectoryMetaSelectBuilder b)]) = _$DirectoryMetaSelect;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DirectoryMetaSelectBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DirectoryMetaSelect> get serializer => _$DirectoryMetaSelectSerializer();
}

class _$DirectoryMetaSelectSerializer implements PrimitiveSerializer<DirectoryMetaSelect> {
  @override
  final Iterable<Type> types = const [DirectoryMetaSelect, _$DirectoryMetaSelect];

  @override
  final String wireName = r'DirectoryMetaSelect';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DirectoryMetaSelect object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.valueField != null) {
      yield r'valueField';
      yield serializers.serialize(
        object.valueField,
        specifiedType: const FullType(num),
      );
    }
    if (object.labelField != null) {
      yield r'labelField';
      yield serializers.serialize(
        object.labelField,
        specifiedType: const FullType(String),
      );
    }
    if (object.parentDirectory != null) {
      yield r'parentDirectory';
      yield serializers.serialize(
        object.parentDirectory,
        specifiedType: const FullType(String),
      );
    }
    if (object.parentKey != null) {
      yield r'parentKey';
      yield serializers.serialize(
        object.parentKey,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DirectoryMetaSelect object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DirectoryMetaSelectBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'valueField':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.valueField = valueDes;
          break;
        case r'labelField':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.labelField = valueDes;
          break;
        case r'parentDirectory':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.parentDirectory = valueDes;
          break;
        case r'parentKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.parentKey = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DirectoryMetaSelect deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DirectoryMetaSelectBuilder();
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

