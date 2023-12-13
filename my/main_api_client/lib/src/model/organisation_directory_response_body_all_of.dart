//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/organisation_directory.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'organisation_directory_response_body_all_of.g.dart';

/// OrganisationDirectoryResponseBodyAllOf
///
/// Properties:
/// * [data] 
@BuiltValue(instantiable: false)
abstract class OrganisationDirectoryResponseBodyAllOf  {
  @BuiltValueField(wireName: r'data')
  OrganisationDirectory? get data;

  @BuiltValueSerializer(custom: true)
  static Serializer<OrganisationDirectoryResponseBodyAllOf> get serializer => _$OrganisationDirectoryResponseBodyAllOfSerializer();
}

class _$OrganisationDirectoryResponseBodyAllOfSerializer implements PrimitiveSerializer<OrganisationDirectoryResponseBodyAllOf> {
  @override
  final Iterable<Type> types = const [OrganisationDirectoryResponseBodyAllOf];

  @override
  final String wireName = r'OrganisationDirectoryResponseBodyAllOf';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OrganisationDirectoryResponseBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(OrganisationDirectory),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    OrganisationDirectoryResponseBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  OrganisationDirectoryResponseBodyAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($OrganisationDirectoryResponseBodyAllOf)) as $OrganisationDirectoryResponseBodyAllOf;
  }
}

/// a concrete implementation of [OrganisationDirectoryResponseBodyAllOf], since [OrganisationDirectoryResponseBodyAllOf] is not instantiable
@BuiltValue(instantiable: true)
abstract class $OrganisationDirectoryResponseBodyAllOf implements OrganisationDirectoryResponseBodyAllOf, Built<$OrganisationDirectoryResponseBodyAllOf, $OrganisationDirectoryResponseBodyAllOfBuilder> {
  $OrganisationDirectoryResponseBodyAllOf._();

  factory $OrganisationDirectoryResponseBodyAllOf([void Function($OrganisationDirectoryResponseBodyAllOfBuilder)? updates]) = _$$OrganisationDirectoryResponseBodyAllOf;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($OrganisationDirectoryResponseBodyAllOfBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$OrganisationDirectoryResponseBodyAllOf> get serializer => _$$OrganisationDirectoryResponseBodyAllOfSerializer();
}

class _$$OrganisationDirectoryResponseBodyAllOfSerializer implements PrimitiveSerializer<$OrganisationDirectoryResponseBodyAllOf> {
  @override
  final Iterable<Type> types = const [$OrganisationDirectoryResponseBodyAllOf, _$$OrganisationDirectoryResponseBodyAllOf];

  @override
  final String wireName = r'$OrganisationDirectoryResponseBodyAllOf';

  @override
  Object serialize(
    Serializers serializers,
    $OrganisationDirectoryResponseBodyAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(OrganisationDirectoryResponseBodyAllOf))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required OrganisationDirectoryResponseBodyAllOfBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(OrganisationDirectory),
          ) as OrganisationDirectory;
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
  $OrganisationDirectoryResponseBodyAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $OrganisationDirectoryResponseBodyAllOfBuilder();
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

