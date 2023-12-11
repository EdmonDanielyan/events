//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'publications_property.g.dart';

/// PublicationsProperty
///
/// Properties:
/// * [id] 
/// * [title] 
/// * [dateCreate] 
/// * [votes] 
@BuiltValue()
abstract class PublicationsProperty implements Built<PublicationsProperty, PublicationsPropertyBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'date_create')
  DateTime? get dateCreate;

  @BuiltValueField(wireName: r'votes')
  int? get votes;

  PublicationsProperty._();

  factory PublicationsProperty([void updates(PublicationsPropertyBuilder b)]) = _$PublicationsProperty;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PublicationsPropertyBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PublicationsProperty> get serializer => _$PublicationsPropertySerializer();
}

class _$PublicationsPropertySerializer implements PrimitiveSerializer<PublicationsProperty> {
  @override
  final Iterable<Type> types = const [PublicationsProperty, _$PublicationsProperty];

  @override
  final String wireName = r'PublicationsProperty';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PublicationsProperty object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType(String),
      );
    }
    if (object.dateCreate != null) {
      yield r'date_create';
      yield serializers.serialize(
        object.dateCreate,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.votes != null) {
      yield r'votes';
      yield serializers.serialize(
        object.votes,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PublicationsProperty object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PublicationsPropertyBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'date_create':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.dateCreate = valueDes;
          break;
        case r'votes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.votes = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PublicationsProperty deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PublicationsPropertyBuilder();
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

