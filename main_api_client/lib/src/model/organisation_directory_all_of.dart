//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/organisation.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'organisation_directory_all_of.g.dart';

/// OrganisationDirectoryAllOf
///
/// Properties:
/// * [items] 
@BuiltValue(instantiable: false)
abstract class OrganisationDirectoryAllOf  {
  @BuiltValueField(wireName: r'items')
  BuiltList<Organisation>? get items;

  @BuiltValueSerializer(custom: true)
  static Serializer<OrganisationDirectoryAllOf> get serializer => _$OrganisationDirectoryAllOfSerializer();
}

class _$OrganisationDirectoryAllOfSerializer implements PrimitiveSerializer<OrganisationDirectoryAllOf> {
  @override
  final Iterable<Type> types = const [OrganisationDirectoryAllOf];

  @override
  final String wireName = r'OrganisationDirectoryAllOf';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OrganisationDirectoryAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.items != null) {
      yield r'items';
      yield serializers.serialize(
        object.items,
        specifiedType: const FullType(BuiltList, [FullType(Organisation)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    OrganisationDirectoryAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  OrganisationDirectoryAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($OrganisationDirectoryAllOf)) as $OrganisationDirectoryAllOf;
  }
}

/// a concrete implementation of [OrganisationDirectoryAllOf], since [OrganisationDirectoryAllOf] is not instantiable
@BuiltValue(instantiable: true)
abstract class $OrganisationDirectoryAllOf implements OrganisationDirectoryAllOf, Built<$OrganisationDirectoryAllOf, $OrganisationDirectoryAllOfBuilder> {
  $OrganisationDirectoryAllOf._();

  factory $OrganisationDirectoryAllOf([void Function($OrganisationDirectoryAllOfBuilder)? updates]) = _$$OrganisationDirectoryAllOf;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($OrganisationDirectoryAllOfBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$OrganisationDirectoryAllOf> get serializer => _$$OrganisationDirectoryAllOfSerializer();
}

class _$$OrganisationDirectoryAllOfSerializer implements PrimitiveSerializer<$OrganisationDirectoryAllOf> {
  @override
  final Iterable<Type> types = const [$OrganisationDirectoryAllOf, _$$OrganisationDirectoryAllOf];

  @override
  final String wireName = r'$OrganisationDirectoryAllOf';

  @override
  Object serialize(
    Serializers serializers,
    $OrganisationDirectoryAllOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(OrganisationDirectoryAllOf))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required OrganisationDirectoryAllOfBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Organisation)]),
          ) as BuiltList<Organisation>;
          result.items.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  $OrganisationDirectoryAllOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $OrganisationDirectoryAllOfBuilder();
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

