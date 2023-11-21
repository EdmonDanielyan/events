//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'events_property.g.dart';

/// EventsProperty
///
/// Properties:
/// * [id] 
/// * [title] 
/// * [dateCreate] 
/// * [dateStart] 
/// * [dateFinish] 
/// * [place] 
/// * [viewCount] 
/// * [previewPicture] 
@BuiltValue()
abstract class EventsProperty implements Built<EventsProperty, EventsPropertyBuilder> {
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

  @BuiltValueField(wireName: r'preview_picture')
  String? get previewPicture;

  EventsProperty._();

  factory EventsProperty([void updates(EventsPropertyBuilder b)]) = _$EventsProperty;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EventsPropertyBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EventsProperty> get serializer => _$EventsPropertySerializer();
}

class _$EventsPropertySerializer implements PrimitiveSerializer<EventsProperty> {
  @override
  final Iterable<Type> types = const [EventsProperty, _$EventsProperty];

  @override
  final String wireName = r'EventsProperty';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EventsProperty object, {
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
    if (object.previewPicture != null) {
      yield r'preview_picture';
      yield serializers.serialize(
        object.previewPicture,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    EventsProperty object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EventsPropertyBuilder result,
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
        case r'preview_picture':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.previewPicture = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EventsProperty deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EventsPropertyBuilder();
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

