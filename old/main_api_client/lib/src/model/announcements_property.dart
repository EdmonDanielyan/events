//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'announcements_property.g.dart';

/// AnnouncementsProperty
///
/// Properties:
/// * [id] 
/// * [title] 
/// * [dateCreate] 
/// * [viewCount] 
@BuiltValue()
abstract class AnnouncementsProperty implements Built<AnnouncementsProperty, AnnouncementsPropertyBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'date_create')
  DateTime? get dateCreate;

  @BuiltValueField(wireName: r'view_count')
  int? get viewCount;

  AnnouncementsProperty._();

  factory AnnouncementsProperty([void updates(AnnouncementsPropertyBuilder b)]) = _$AnnouncementsProperty;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AnnouncementsPropertyBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AnnouncementsProperty> get serializer => _$AnnouncementsPropertySerializer();
}

class _$AnnouncementsPropertySerializer implements PrimitiveSerializer<AnnouncementsProperty> {
  @override
  final Iterable<Type> types = const [AnnouncementsProperty, _$AnnouncementsProperty];

  @override
  final String wireName = r'AnnouncementsProperty';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AnnouncementsProperty object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'date_create';
    yield object.dateCreate == null ? null : serializers.serialize(
      object.dateCreate,
      specifiedType: const FullType.nullable(DateTime),
    );
    yield r'view_count';
    yield object.viewCount == null ? null : serializers.serialize(
      object.viewCount,
      specifiedType: const FullType.nullable(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AnnouncementsProperty object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AnnouncementsPropertyBuilder result,
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
        case r'view_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.viewCount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AnnouncementsProperty deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AnnouncementsPropertyBuilder();
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

