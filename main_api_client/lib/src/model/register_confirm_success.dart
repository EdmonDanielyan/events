//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:openapi/src/model/required_success.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_confirm_success.g.dart';

/// RegisterConfirmSuccess
///
/// Properties:
/// * [status] 
/// * [data] 
/// * [success] 
/// * [host] 
/// * [version] 
/// * [returned] 
@BuiltValue()
abstract class RegisterConfirmSuccess implements RequiredSuccess, Built<RegisterConfirmSuccess, RegisterConfirmSuccessBuilder> {
  @BuiltValueField(wireName: r'data')
  JsonObject? get data;

  RegisterConfirmSuccess._();

  factory RegisterConfirmSuccess([void updates(RegisterConfirmSuccessBuilder b)]) = _$RegisterConfirmSuccess;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegisterConfirmSuccessBuilder b) => b
      ..host = 'https://example.com'
      ..version = '1.0.0'
      ..success = true
      ..status = 200;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegisterConfirmSuccess> get serializer => _$RegisterConfirmSuccessSerializer();
}

class _$RegisterConfirmSuccessSerializer implements PrimitiveSerializer<RegisterConfirmSuccess> {
  @override
  final Iterable<Type> types = const [RegisterConfirmSuccess, _$RegisterConfirmSuccess];

  @override
  final String wireName = r'RegisterConfirmSuccess';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegisterConfirmSuccess object, {
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
        specifiedType: const FullType(JsonObject),
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
    RegisterConfirmSuccess object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RegisterConfirmSuccessBuilder result,
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
            specifiedType: const FullType(JsonObject),
          ) as JsonObject;
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
  RegisterConfirmSuccess deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegisterConfirmSuccessBuilder();
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

