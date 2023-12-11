//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/subscription_state.dart';
import 'package:openapi/src/model/uni_event_detail.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'uni_events_get_detail_resp_body_all_of_data.g.dart';

/// UniEventsGetDetailRespBodyAllOfData
///
/// Properties:
/// * [event] 
/// * [subscription] 
@BuiltValue()
abstract class UniEventsGetDetailRespBodyAllOfData implements Built<UniEventsGetDetailRespBodyAllOfData, UniEventsGetDetailRespBodyAllOfDataBuilder> {
  @BuiltValueField(wireName: r'event')
  UniEventDetail? get event;

  @BuiltValueField(wireName: r'subscription')
  SubscriptionState? get subscription;

  UniEventsGetDetailRespBodyAllOfData._();

  factory UniEventsGetDetailRespBodyAllOfData([void updates(UniEventsGetDetailRespBodyAllOfDataBuilder b)]) = _$UniEventsGetDetailRespBodyAllOfData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UniEventsGetDetailRespBodyAllOfDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UniEventsGetDetailRespBodyAllOfData> get serializer => _$UniEventsGetDetailRespBodyAllOfDataSerializer();
}

class _$UniEventsGetDetailRespBodyAllOfDataSerializer implements PrimitiveSerializer<UniEventsGetDetailRespBodyAllOfData> {
  @override
  final Iterable<Type> types = const [UniEventsGetDetailRespBodyAllOfData, _$UniEventsGetDetailRespBodyAllOfData];

  @override
  final String wireName = r'UniEventsGetDetailRespBodyAllOfData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UniEventsGetDetailRespBodyAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.event != null) {
      yield r'event';
      yield serializers.serialize(
        object.event,
        specifiedType: const FullType(UniEventDetail),
      );
    }
    if (object.subscription != null) {
      yield r'subscription';
      yield serializers.serialize(
        object.subscription,
        specifiedType: const FullType(SubscriptionState),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UniEventsGetDetailRespBodyAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UniEventsGetDetailRespBodyAllOfDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'event':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UniEventDetail),
          ) as UniEventDetail;
          result.event.replace(valueDes);
          break;
        case r'subscription':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SubscriptionState),
          ) as SubscriptionState;
          result.subscription.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UniEventsGetDetailRespBodyAllOfData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UniEventsGetDetailRespBodyAllOfDataBuilder();
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

