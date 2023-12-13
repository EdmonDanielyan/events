//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'uni_sub_request_option.g.dart';

/// Опция запроса на запись
///
/// Properties:
/// * [id] - ID опции
/// * [value] - Количество опции. Если разрешено ручное указание количество - указанное значение, в остальных случаях - 1.
@BuiltValue()
abstract class UniSubRequestOption implements Built<UniSubRequestOption, UniSubRequestOptionBuilder> {
  /// ID опции
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Количество опции. Если разрешено ручное указание количество - указанное значение, в остальных случаях - 1.
  @BuiltValueField(wireName: r'value')
  int get value;

  UniSubRequestOption._();

  factory UniSubRequestOption([void updates(UniSubRequestOptionBuilder b)]) = _$UniSubRequestOption;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UniSubRequestOptionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UniSubRequestOption> get serializer => _$UniSubRequestOptionSerializer();
}

class _$UniSubRequestOptionSerializer implements PrimitiveSerializer<UniSubRequestOption> {
  @override
  final Iterable<Type> types = const [UniSubRequestOption, _$UniSubRequestOption];

  @override
  final String wireName = r'UniSubRequestOption';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UniSubRequestOption object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'value';
    yield serializers.serialize(
      object.value,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UniSubRequestOption object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UniSubRequestOptionBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
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
  UniSubRequestOption deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UniSubRequestOptionBuilder();
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

