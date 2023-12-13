//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'uni_sub_cancel_request.g.dart';

/// Запрос на отмену записи
///
/// Properties:
/// * [reason] - Причина отписки
@BuiltValue()
abstract class UniSubCancelRequest implements Built<UniSubCancelRequest, UniSubCancelRequestBuilder> {
  /// Причина отписки
  @BuiltValueField(wireName: r'reason')
  String? get reason;

  UniSubCancelRequest._();

  factory UniSubCancelRequest([void updates(UniSubCancelRequestBuilder b)]) = _$UniSubCancelRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UniSubCancelRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UniSubCancelRequest> get serializer => _$UniSubCancelRequestSerializer();
}

class _$UniSubCancelRequestSerializer implements PrimitiveSerializer<UniSubCancelRequest> {
  @override
  final Iterable<Type> types = const [UniSubCancelRequest, _$UniSubCancelRequest];

  @override
  final String wireName = r'UniSubCancelRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UniSubCancelRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.reason != null) {
      yield r'reason';
      yield serializers.serialize(
        object.reason,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UniSubCancelRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UniSubCancelRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'reason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.reason = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UniSubCancelRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UniSubCancelRequestBuilder();
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

