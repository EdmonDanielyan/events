//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'required_success.g.dart';

/// RequiredSuccess
///
/// Properties:
/// * [success] 
/// * [host] 
/// * [version] 
/// * [returned] 
/// * [status] 
@BuiltValue(instantiable: false)
abstract class RequiredSuccess  {
  @BuiltValueField(wireName: r'success')
  bool get success;

  @BuiltValueField(wireName: r'host')
  String get host;

  @BuiltValueField(wireName: r'version')
  String get version;

  @BuiltValueField(wireName: r'returned')
  DateTime get returned;

  @BuiltValueField(wireName: r'status')
  int get status;

  @BuiltValueSerializer(custom: true)
  static Serializer<RequiredSuccess> get serializer => _$RequiredSuccessSerializer();
}

class _$RequiredSuccessSerializer implements PrimitiveSerializer<RequiredSuccess> {
  @override
  final Iterable<Type> types = const [RequiredSuccess];

  @override
  final String wireName = r'RequiredSuccess';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RequiredSuccess object, {
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
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RequiredSuccess object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  RequiredSuccess deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($RequiredSuccess)) as $RequiredSuccess;
  }
}

/// a concrete implementation of [RequiredSuccess], since [RequiredSuccess] is not instantiable
@BuiltValue(instantiable: true)
abstract class $RequiredSuccess implements RequiredSuccess, Built<$RequiredSuccess, $RequiredSuccessBuilder> {
  $RequiredSuccess._();

  factory $RequiredSuccess([void Function($RequiredSuccessBuilder)? updates]) = _$$RequiredSuccess;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($RequiredSuccessBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$RequiredSuccess> get serializer => _$$RequiredSuccessSerializer();
}

class _$$RequiredSuccessSerializer implements PrimitiveSerializer<$RequiredSuccess> {
  @override
  final Iterable<Type> types = const [$RequiredSuccess, _$$RequiredSuccess];

  @override
  final String wireName = r'$RequiredSuccess';

  @override
  Object serialize(
    Serializers serializers,
    $RequiredSuccess object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(RequiredSuccess))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RequiredSuccessBuilder result,
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
  $RequiredSuccess deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $RequiredSuccessBuilder();
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

