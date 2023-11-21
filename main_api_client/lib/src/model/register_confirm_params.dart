//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_confirm_params.g.dart';

/// RegisterConfirmParams
///
/// Properties:
/// * [phone] - Номер телефона пользователя указанный при регистрации
/// * [code] - Код подтверждения
@BuiltValue()
abstract class RegisterConfirmParams implements Built<RegisterConfirmParams, RegisterConfirmParamsBuilder> {
  /// Номер телефона пользователя указанный при регистрации
  @BuiltValueField(wireName: r'phone')
  String? get phone;

  /// Код подтверждения
  @BuiltValueField(wireName: r'code')
  int? get code;

  RegisterConfirmParams._();

  factory RegisterConfirmParams([void updates(RegisterConfirmParamsBuilder b)]) = _$RegisterConfirmParams;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegisterConfirmParamsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegisterConfirmParams> get serializer => _$RegisterConfirmParamsSerializer();
}

class _$RegisterConfirmParamsSerializer implements PrimitiveSerializer<RegisterConfirmParams> {
  @override
  final Iterable<Type> types = const [RegisterConfirmParams, _$RegisterConfirmParams];

  @override
  final String wireName = r'RegisterConfirmParams';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegisterConfirmParams object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.phone != null) {
      yield r'phone';
      yield serializers.serialize(
        object.phone,
        specifiedType: const FullType(String),
      );
    }
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    RegisterConfirmParams object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RegisterConfirmParamsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'phone':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.phone = valueDes;
          break;
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.code = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RegisterConfirmParams deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegisterConfirmParamsBuilder();
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

