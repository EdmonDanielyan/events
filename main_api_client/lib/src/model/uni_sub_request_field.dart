//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'uni_sub_request_field.g.dart';

/// Запрос на универсальную запись
///
/// Properties:
/// * [code] - Код свойства
/// * [value] - Значение
@BuiltValue()
abstract class UniSubRequestField implements Built<UniSubRequestField, UniSubRequestFieldBuilder> {
  /// Код свойства
  @BuiltValueField(wireName: r'code')
  String? get code;

  /// Значение
  @BuiltValueField(wireName: r'value')
  String? get value;

  UniSubRequestField._();

  factory UniSubRequestField([void updates(UniSubRequestFieldBuilder b)]) = _$UniSubRequestField;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UniSubRequestFieldBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UniSubRequestField> get serializer => _$UniSubRequestFieldSerializer();
}

class _$UniSubRequestFieldSerializer implements PrimitiveSerializer<UniSubRequestField> {
  @override
  final Iterable<Type> types = const [UniSubRequestField, _$UniSubRequestField];

  @override
  final String wireName = r'UniSubRequestField';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UniSubRequestField object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
        specifiedType: const FullType(String),
      );
    }
    if (object.value != null) {
      yield r'value';
      yield serializers.serialize(
        object.value,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UniSubRequestField object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UniSubRequestFieldBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        case r'value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.value = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UniSubRequestField deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UniSubRequestFieldBuilder();
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

