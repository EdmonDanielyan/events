//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/uni_events_get_list_resp_body_all_of_data.dart';
import 'package:openapi/src/model/uni_events_get_list_resp_body_all_of.dart';
import 'package:openapi/src/model/required_success.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'uni_events_get_list_resp_body.g.dart';

/// UniEventsGetListRespBody
///
/// Properties:
/// * [success] 
/// * [host] 
/// * [version] 
/// * [returned] 
/// * [status] 
/// * [data] 
@BuiltValue()
abstract class UniEventsGetListRespBody implements RequiredSuccess, UniEventsGetListRespBodyAllOf, Built<UniEventsGetListRespBody, UniEventsGetListRespBodyBuilder> {
  UniEventsGetListRespBody._();

  factory UniEventsGetListRespBody([void updates(UniEventsGetListRespBodyBuilder b)]) = _$UniEventsGetListRespBody;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UniEventsGetListRespBodyBuilder b) => b
      ..success = true
      ..host = 'https://example.com'
      ..version = '1.0.0'
      ..status = 200;

  @BuiltValueSerializer(custom: true)
  static Serializer<UniEventsGetListRespBody> get serializer => _$UniEventsGetListRespBodySerializer();
}

class _$UniEventsGetListRespBodySerializer implements PrimitiveSerializer<UniEventsGetListRespBody> {
  @override
  final Iterable<Type> types = const [UniEventsGetListRespBody, _$UniEventsGetListRespBody];

  @override
  final String wireName = r'UniEventsGetListRespBody';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UniEventsGetListRespBody object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(UniEventsGetListRespBodyAllOfData),
    );
    yield r'success';
    yield serializers.serialize(
      object.success,
      specifiedType: const FullType(bool),
    );
    yield r'host';
    yield serializers.serialize(
      object.host,
      specifiedType: const FullType(String),
    );
    yield r'returned';
    yield serializers.serialize(
      object.returned,
      specifiedType: const FullType(DateTime),
    );
    yield r'version';
    yield serializers.serialize(
      object.version,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UniEventsGetListRespBody object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UniEventsGetListRespBodyBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UniEventsGetListRespBodyAllOfData),
          ) as UniEventsGetListRespBodyAllOfData;
          result.data.replace(valueDes);
          break;
        case r'success':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.success = valueDes;
          break;
        case r'host':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.host = valueDes;
          break;
        case r'returned':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.returned = valueDes;
          break;
        case r'version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.version = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.status = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UniEventsGetListRespBody deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UniEventsGetListRespBodyBuilder();
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

