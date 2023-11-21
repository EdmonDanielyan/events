//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'logout_params.g.dart';

/// LogoutParams
///
/// Properties:
/// * [token] 
@BuiltValue()
abstract class LogoutParams implements Built<LogoutParams, LogoutParamsBuilder> {
  @BuiltValueField(wireName: r'token')
  String get token;

  LogoutParams._();

  factory LogoutParams([void updates(LogoutParamsBuilder b)]) = _$LogoutParams;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LogoutParamsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LogoutParams> get serializer => _$LogoutParamsSerializer();
}

class _$LogoutParamsSerializer implements PrimitiveSerializer<LogoutParams> {
  @override
  final Iterable<Type> types = const [LogoutParams, _$LogoutParams];

  @override
  final String wireName = r'LogoutParams';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LogoutParams object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'token';
    yield serializers.serialize(
      object.token,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    LogoutParams object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required LogoutParamsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.token = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  LogoutParams deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LogoutParamsBuilder();
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

