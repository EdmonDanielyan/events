//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/date.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'uni_sub_request_visitor_new.g.dart';

/// Новый родственник
///
/// Properties:
/// * [name] - Имя
/// * [type] - Тип
/// * [birthday] - Дата рождения
/// * [option] - ID выбранной опции, если опции выбираются для каждого посетителя индивидуально
@BuiltValue()
abstract class UniSubRequestVisitorNew implements Built<UniSubRequestVisitorNew, UniSubRequestVisitorNewBuilder> {
  /// Имя
  @BuiltValueField(wireName: r'name')
  String? get name;

  /// Тип
  @BuiltValueField(wireName: r'type')
  String? get type;

  /// Дата рождения
  @BuiltValueField(wireName: r'birthday')
  Date? get birthday;

  /// ID выбранной опции, если опции выбираются для каждого посетителя индивидуально
  @BuiltValueField(wireName: r'option')
  String? get option;

  UniSubRequestVisitorNew._();

  factory UniSubRequestVisitorNew([void updates(UniSubRequestVisitorNewBuilder b)]) = _$UniSubRequestVisitorNew;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UniSubRequestVisitorNewBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UniSubRequestVisitorNew> get serializer => _$UniSubRequestVisitorNewSerializer();
}

class _$UniSubRequestVisitorNewSerializer implements PrimitiveSerializer<UniSubRequestVisitorNew> {
  @override
  final Iterable<Type> types = const [UniSubRequestVisitorNew, _$UniSubRequestVisitorNew];

  @override
  final String wireName = r'UniSubRequestVisitorNew';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UniSubRequestVisitorNew object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType(String),
      );
    }
    if (object.birthday != null) {
      yield r'birthday';
      yield serializers.serialize(
        object.birthday,
        specifiedType: const FullType.nullable(Date),
      );
    }
    if (object.option != null) {
      yield r'option';
      yield serializers.serialize(
        object.option,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UniSubRequestVisitorNew object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UniSubRequestVisitorNewBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.type = valueDes;
          break;
        case r'birthday':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(Date),
          ) as Date?;
          if (valueDes == null) continue;
          result.birthday = valueDes;
          break;
        case r'option':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.option = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UniSubRequestVisitorNew deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UniSubRequestVisitorNewBuilder();
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

