//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/uni_event_short.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'uni_events_get_list_resp_body_all_of_data.g.dart';

/// UniEventsGetListRespBodyAllOfData
///
/// Properties:
/// * [totalCount] 
/// * [events] 
@BuiltValue()
abstract class UniEventsGetListRespBodyAllOfData implements Built<UniEventsGetListRespBodyAllOfData, UniEventsGetListRespBodyAllOfDataBuilder> {
  @BuiltValueField(wireName: r'total_count')
  int? get totalCount;

  @BuiltValueField(wireName: r'events')
  BuiltList<UniEventShort>? get events;

  UniEventsGetListRespBodyAllOfData._();

  factory UniEventsGetListRespBodyAllOfData([void updates(UniEventsGetListRespBodyAllOfDataBuilder b)]) = _$UniEventsGetListRespBodyAllOfData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UniEventsGetListRespBodyAllOfDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UniEventsGetListRespBodyAllOfData> get serializer => _$UniEventsGetListRespBodyAllOfDataSerializer();
}

class _$UniEventsGetListRespBodyAllOfDataSerializer implements PrimitiveSerializer<UniEventsGetListRespBodyAllOfData> {
  @override
  final Iterable<Type> types = const [UniEventsGetListRespBodyAllOfData, _$UniEventsGetListRespBodyAllOfData];

  @override
  final String wireName = r'UniEventsGetListRespBodyAllOfData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UniEventsGetListRespBodyAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.totalCount != null) {
      yield r'total_count';
      yield serializers.serialize(
        object.totalCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.events != null) {
      yield r'events';
      yield serializers.serialize(
        object.events,
        specifiedType: const FullType(BuiltList, [FullType(UniEventShort)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UniEventsGetListRespBodyAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UniEventsGetListRespBodyAllOfDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'total_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.totalCount = valueDes;
          break;
        case r'events':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(UniEventShort)]),
          ) as BuiltList<UniEventShort>;
          result.events.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UniEventsGetListRespBodyAllOfData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UniEventsGetListRespBodyAllOfDataBuilder();
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

