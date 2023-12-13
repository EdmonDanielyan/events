//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/required_success.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'order_reference_success.g.dart';

/// OrderReferenceSuccess
///
/// Properties:
/// * [data] 
/// * [success] 
/// * [host] 
/// * [version] 
/// * [returned] 
/// * [status] 
@BuiltValue()
abstract class OrderReferenceSuccess implements RequiredSuccess, Built<OrderReferenceSuccess, OrderReferenceSuccessBuilder> {
  @BuiltValueField(wireName: r'data')
  String? get data;

  OrderReferenceSuccess._();

  factory OrderReferenceSuccess([void updates(OrderReferenceSuccessBuilder b)]) = _$OrderReferenceSuccess;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OrderReferenceSuccessBuilder b) => b
      ..host = 'https://example.com'
      ..version = '1.0.0'
      ..success = true
      ..status = 200;

  @BuiltValueSerializer(custom: true)
  static Serializer<OrderReferenceSuccess> get serializer => _$OrderReferenceSuccessSerializer();
}

class _$OrderReferenceSuccessSerializer implements PrimitiveSerializer<OrderReferenceSuccess> {
  @override
  final Iterable<Type> types = const [OrderReferenceSuccess, _$OrderReferenceSuccess];

  @override
  final String wireName = r'OrderReferenceSuccess';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OrderReferenceSuccess object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'host';
    yield serializers.serialize(
      object.host,
      specifiedType: const FullType(String),
    );
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(String),
      );
    }
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
    yield r'success';
    yield serializers.serialize(
      object.success,
      specifiedType: const FullType(bool),
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
    OrderReferenceSuccess object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required OrderReferenceSuccessBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'host':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.host = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.data = valueDes;
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
        case r'success':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.success = valueDes;
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
  OrderReferenceSuccess deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OrderReferenceSuccessBuilder();
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

