//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'announcement_property.g.dart';

/// AnnouncementProperty
///
/// Properties:
/// * [id] 
/// * [title] 
/// * [dateCreate] 
/// * [viewCount] 
/// * [detailText] 
@BuiltValue()
abstract class AnnouncementProperty implements Built<AnnouncementProperty, AnnouncementPropertyBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'date_create')
  DateTime? get dateCreate;

  @BuiltValueField(wireName: r'view_count')
  int? get viewCount;

  @BuiltValueField(wireName: r'detail_text')
  String? get detailText;

  AnnouncementProperty._();

  factory AnnouncementProperty([void updates(AnnouncementPropertyBuilder b)]) = _$AnnouncementProperty;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AnnouncementPropertyBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AnnouncementProperty> get serializer => _$AnnouncementPropertySerializer();
}

class _$AnnouncementPropertySerializer implements PrimitiveSerializer<AnnouncementProperty> {
  @override
  final Iterable<Type> types = const [AnnouncementProperty, _$AnnouncementProperty];

  @override
  final String wireName = r'AnnouncementProperty';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AnnouncementProperty object, {
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
    yield r'detail_text';
    yield object.detailText == null ? null : serializers.serialize(
      object.detailText,
      specifiedType: const FullType.nullable(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AnnouncementProperty object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AnnouncementPropertyBuilder result,
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
        case r'detail_text':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.detailText = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AnnouncementProperty deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AnnouncementPropertyBuilder();
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

