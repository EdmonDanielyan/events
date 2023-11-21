//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/global_settings.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'global_settings_response_body_all_of.g.dart';

/// GlobalSettingsResponseBodyAllOf
///
/// Properties:
/// * [data] 
@BuiltValue(instantiable: false)
abstract class GlobalSettingsResponseBodyAllOf  {
  @BuiltValueField(wireName: r'data')
  GlobalSettings? get data;

  @BuiltValueSerializer(custom: true)
  static Serializer<GlobalSettingsResponseBodyAllOf> get serializer => _$GlobalSettingsResponseBodyAllOfSerializer();
}

class _$GlobalSettingsResponseBodyAllOfSerializer implements PrimitiveSerializer<GlobalSettingsResponseBodyAllOf> {
  @override
  final Iterable<Type> types = const [GlobalSettingsResponseBodyAllOf];

  @override
  final String wireName = r'GlobalSettingsResponseBodyAllOf';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GlobalSettingsResponseBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(GlobalSettings),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GlobalSettingsResponseBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  GlobalSettingsResponseBodyAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($GlobalSettingsResponseBodyAllOf)) as $GlobalSettingsResponseBodyAllOf;
  }
}

/// a concrete implementation of [GlobalSettingsResponseBodyAllOf], since [GlobalSettingsResponseBodyAllOf] is not instantiable
@BuiltValue(instantiable: true)
abstract class $GlobalSettingsResponseBodyAllOf implements GlobalSettingsResponseBodyAllOf, Built<$GlobalSettingsResponseBodyAllOf, $GlobalSettingsResponseBodyAllOfBuilder> {
  $GlobalSettingsResponseBodyAllOf._();

  factory $GlobalSettingsResponseBodyAllOf([void Function($GlobalSettingsResponseBodyAllOfBuilder)? updates]) = _$$GlobalSettingsResponseBodyAllOf;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($GlobalSettingsResponseBodyAllOfBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$GlobalSettingsResponseBodyAllOf> get serializer => _$$GlobalSettingsResponseBodyAllOfSerializer();
}

class _$$GlobalSettingsResponseBodyAllOfSerializer implements PrimitiveSerializer<$GlobalSettingsResponseBodyAllOf> {
  @override
  final Iterable<Type> types = const [$GlobalSettingsResponseBodyAllOf, _$$GlobalSettingsResponseBodyAllOf];

  @override
  final String wireName = r'$GlobalSettingsResponseBodyAllOf';

  @override
  Object serialize(
    Serializers serializers,
    $GlobalSettingsResponseBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(GlobalSettingsResponseBodyAllOf))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GlobalSettingsResponseBodyAllOfBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(GlobalSettings),
          ) as GlobalSettings;
          result.data.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  $GlobalSettingsResponseBodyAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $GlobalSettingsResponseBodyAllOfBuilder();
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

