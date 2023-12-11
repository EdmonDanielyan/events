//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'event_property.g.dart';

/// EventProperty
///
/// Properties:
/// * [id] 
/// * [title] 
/// * [dateCreate] 
/// * [dateStart] 
/// * [dateFinish] 
/// * [place] 
/// * [viewCount] 
/// * [detailText] 
/// * [detailPicture] 
/// * [isMember] 
@BuiltValue()
abstract class EventProperty implements Built<EventProperty, EventPropertyBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'date_create')
  DateTime? get dateCreate;

  @BuiltValueField(wireName: r'date_start')
  DateTime? get dateStart;

  @BuiltValueField(wireName: r'date_finish')
  DateTime? get dateFinish;

  @BuiltValueField(wireName: r'place')
  String? get place;

  @BuiltValueField(wireName: r'view_count')
  int? get viewCount;

  @BuiltValueField(wireName: r'detail_text')
  String? get detailText;

  @BuiltValueField(wireName: r'detail_picture')
  String? get detailPicture;

  @BuiltValueField(wireName: r'is_member')
  bool? get isMember;

  EventProperty._();

  factory EventProperty([void updates(EventPropertyBuilder b)]) = _$EventProperty;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EventPropertyBuilder b) => b
      ..isMember = false;

  @BuiltValueSerializer(custom: true)
  static Serializer<EventProperty> get serializer => _$EventPropertySerializer();
}

class _$EventPropertySerializer implements PrimitiveSerializer<EventProperty> {
  @override
  final Iterable<Type> types = const [EventProperty, _$EventProperty];

  @override
  final String wireName = r'EventProperty';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EventProperty object, {
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
    if (object.dateStart != null) {
      yield r'date_start';
      yield serializers.serialize(
        object.dateStart,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.dateFinish != null) {
      yield r'date_finish';
      yield serializers.serialize(
        object.dateFinish,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.place != null) {
      yield r'place';
      yield serializers.serialize(
        object.place,
        specifiedType: const FullType.nullable(String),
      );
    }
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
    yield r'detail_picture';
    yield object.detailPicture == null ? null : serializers.serialize(
      object.detailPicture,
      specifiedType: const FullType.nullable(String),
    );
    if (object.isMember != null) {
      yield r'is_member';
      yield serializers.serialize(
        object.isMember,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    EventProperty object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EventPropertyBuilder result,
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
        case r'date_start':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.dateStart = valueDes;
          break;
        case r'date_finish':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.dateFinish = valueDes;
          break;
        case r'place':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.place = valueDes;
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
        case r'detail_picture':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.detailPicture = valueDes;
          break;
        case r'is_member':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isMember = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EventProperty deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EventPropertyBuilder();
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

