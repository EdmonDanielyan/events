//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/date.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'uni_event_short.g.dart';

/// Краткое описание события
///
/// Properties:
/// * [id] - ID события
/// * [title] - Заголовок
/// * [place] - Место проведения
/// * [viewCount] - Количество просмотров
/// * [dates] - Список дат проведения (если их несколько)
/// * [dateStart] - Дата и время начала
/// * [dateFinish] - Дата и время окончания
/// * [previewPicture] - Картинка
@BuiltValue()
abstract class UniEventShort implements Built<UniEventShort, UniEventShortBuilder> {
  /// ID события
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// Заголовок
  @BuiltValueField(wireName: r'title')
  String? get title;

  /// Место проведения
  @BuiltValueField(wireName: r'place')
  String? get place;

  /// Количество просмотров
  @BuiltValueField(wireName: r'viewCount')
  String? get viewCount;

  /// Список дат проведения (если их несколько)
  @BuiltValueField(wireName: r'dates')
  BuiltList<Date>? get dates;

  /// Дата и время начала
  @BuiltValueField(wireName: r'dateStart')
  DateTime? get dateStart;

  /// Дата и время окончания
  @BuiltValueField(wireName: r'dateFinish')
  DateTime? get dateFinish;

  /// Картинка
  @BuiltValueField(wireName: r'previewPicture')
  String? get previewPicture;

  UniEventShort._();

  factory UniEventShort([void updates(UniEventShortBuilder b)]) = _$UniEventShort;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UniEventShortBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UniEventShort> get serializer => _$UniEventShortSerializer();
}

class _$UniEventShortSerializer implements PrimitiveSerializer<UniEventShort> {
  @override
  final Iterable<Type> types = const [UniEventShort, _$UniEventShort];

  @override
  final String wireName = r'UniEventShort';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UniEventShort object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType(String),
      );
    }
    if (object.place != null) {
      yield r'place';
      yield serializers.serialize(
        object.place,
        specifiedType: const FullType(String),
      );
    }
    if (object.viewCount != null) {
      yield r'viewCount';
      yield serializers.serialize(
        object.viewCount,
        specifiedType: const FullType(String),
      );
    }
    if (object.dates != null) {
      yield r'dates';
      yield serializers.serialize(
        object.dates,
        specifiedType: const FullType.nullable(BuiltList, [FullType(Date)]),
      );
    }
    if (object.dateStart != null) {
      yield r'dateStart';
      yield serializers.serialize(
        object.dateStart,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.dateFinish != null) {
      yield r'dateFinish';
      yield serializers.serialize(
        object.dateFinish,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.previewPicture != null) {
      yield r'previewPicture';
      yield serializers.serialize(
        object.previewPicture,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UniEventShort object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UniEventShortBuilder result,
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
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'place':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.place = valueDes;
          break;
        case r'viewCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.viewCount = valueDes;
          break;
        case r'dates':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(Date)]),
          ) as BuiltList<Date>?;
          if (valueDes == null) continue;
          result.dates.replace(valueDes);
          break;
        case r'dateStart':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.dateStart = valueDes;
          break;
        case r'dateFinish':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.dateFinish = valueDes;
          break;
        case r'previewPicture':
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
  UniEventShort deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UniEventShortBuilder();
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

