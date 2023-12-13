//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'movements_object.g.dart';

/// MovementsObject
///
/// Properties:
/// * [period] 
/// * [position] 
/// * [department] 
/// * [organization] 
/// * [operation] 
/// * [pnum] 
@BuiltValue()
abstract class MovementsObject implements Built<MovementsObject, MovementsObjectBuilder> {
  @BuiltValueField(wireName: r'period')
  String? get period;

  @BuiltValueField(wireName: r'position')
  String? get position;

  @BuiltValueField(wireName: r'department')
  String? get department;

  @BuiltValueField(wireName: r'organization')
  String? get organization;

  @BuiltValueField(wireName: r'operation')
  String? get operation;

  @BuiltValueField(wireName: r'pnum')
  String? get pnum;

  MovementsObject._();

  factory MovementsObject([void updates(MovementsObjectBuilder b)]) = _$MovementsObject;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MovementsObjectBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MovementsObject> get serializer => _$MovementsObjectSerializer();
}

class _$MovementsObjectSerializer implements PrimitiveSerializer<MovementsObject> {
  @override
  final Iterable<Type> types = const [MovementsObject, _$MovementsObject];

  @override
  final String wireName = r'MovementsObject';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MovementsObject object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'period';
    yield object.period == null ? null : serializers.serialize(
      object.period,
      specifiedType: const FullType.nullable(String),
    );
    yield r'position';
    yield object.position == null ? null : serializers.serialize(
      object.position,
      specifiedType: const FullType.nullable(String),
    );
    yield r'department';
    yield object.department == null ? null : serializers.serialize(
      object.department,
      specifiedType: const FullType.nullable(String),
    );
    yield r'organization';
    yield object.organization == null ? null : serializers.serialize(
      object.organization,
      specifiedType: const FullType.nullable(String),
    );
    yield r'operation';
    yield object.operation == null ? null : serializers.serialize(
      object.operation,
      specifiedType: const FullType.nullable(String),
    );
    yield r'pnum';
    yield object.pnum == null ? null : serializers.serialize(
      object.pnum,
      specifiedType: const FullType.nullable(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MovementsObject object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MovementsObjectBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'period':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.period = valueDes;
          break;
        case r'position':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.position = valueDes;
          break;
        case r'department':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.department = valueDes;
          break;
        case r'organization':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.organization = valueDes;
          break;
        case r'operation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.operation = valueDes;
          break;
        case r'pnum':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.pnum = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MovementsObject deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MovementsObjectBuilder();
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

