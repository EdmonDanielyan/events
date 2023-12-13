//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'required_error.g.dart';

/// RequiredError
///
/// Properties:
/// * [success] 
/// * [host] 
/// * [version] 
/// * [returned] 
/// * [type] 
/// * [instance] 
@BuiltValue(instantiable: false)
abstract class RequiredError  {
  @BuiltValueField(wireName: r'success')
  bool get success;

  @BuiltValueField(wireName: r'host')
  String get host;

  @BuiltValueField(wireName: r'version')
  String get version;

  @BuiltValueField(wireName: r'returned')
  DateTime get returned;

  @BuiltValueField(wireName: r'type')
  String get type;

  @BuiltValueField(wireName: r'instance')
  String get instance;

  @BuiltValueSerializer(custom: true)
  static Serializer<RequiredError> get serializer => _$RequiredErrorSerializer();
}

class _$RequiredErrorSerializer implements PrimitiveSerializer<RequiredError> {
  @override
  final Iterable<Type> types = const [RequiredError];

  @override
  final String wireName = r'RequiredError';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RequiredError object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    yield r'version';
    yield serializers.serialize(
      object.version,
      specifiedType: const FullType(String),
    );
    yield r'returned';
    yield serializers.serialize(
      object.returned,
      specifiedType: const FullType(DateTime),
    );
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(String),
    );
    yield r'instance';
    yield serializers.serialize(
      object.instance,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RequiredError object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  RequiredError deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($RequiredError)) as $RequiredError;
  }
}

/// a concrete implementation of [RequiredError], since [RequiredError] is not instantiable
@BuiltValue(instantiable: true)
abstract class $RequiredError implements RequiredError, Built<$RequiredError, $RequiredErrorBuilder> {
  $RequiredError._();

  factory $RequiredError([void Function($RequiredErrorBuilder)? updates]) = _$$RequiredError;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($RequiredErrorBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$RequiredError> get serializer => _$$RequiredErrorSerializer();
}

class _$$RequiredErrorSerializer implements PrimitiveSerializer<$RequiredError> {
  @override
  final Iterable<Type> types = const [$RequiredError, _$$RequiredError];

  @override
  final String wireName = r'$RequiredError';

  @override
  Object serialize(
    Serializers serializers,
    $RequiredError object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(RequiredError))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RequiredErrorBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        case r'version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.version = valueDes;
          break;
        case r'returned':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.returned = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.type = valueDes;
          break;
        case r'instance':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.instance = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  $RequiredError deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $RequiredErrorBuilder();
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

