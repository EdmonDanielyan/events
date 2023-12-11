//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'refresh_token_params.g.dart';

/// RefreshTokenParams
///
/// Properties:
/// * [token] 
@BuiltValue()
abstract class RefreshTokenParams implements Built<RefreshTokenParams, RefreshTokenParamsBuilder> {
  @BuiltValueField(wireName: r'token')
  String get token;

  RefreshTokenParams._();

  factory RefreshTokenParams([void updates(RefreshTokenParamsBuilder b)]) = _$RefreshTokenParams;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RefreshTokenParamsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RefreshTokenParams> get serializer => _$RefreshTokenParamsSerializer();
}

class _$RefreshTokenParamsSerializer implements PrimitiveSerializer<RefreshTokenParams> {
  @override
  final Iterable<Type> types = const [RefreshTokenParams, _$RefreshTokenParams];

  @override
  final String wireName = r'RefreshTokenParams';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RefreshTokenParams object, {
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
    RefreshTokenParams object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RefreshTokenParamsBuilder result,
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
  RefreshTokenParams deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RefreshTokenParamsBuilder();
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

