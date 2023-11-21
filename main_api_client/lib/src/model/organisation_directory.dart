//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/organisation.dart';
import 'package:openapi/src/model/organisation_directory_all_of.dart';
import 'package:openapi/src/model/directory_meta_select.dart';
import 'package:openapi/src/model/directory_meta.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'organisation_directory.g.dart';

/// OrganisationDirectory
///
/// Properties:
/// * [select] 
/// * [items] 
@BuiltValue()
abstract class OrganisationDirectory implements DirectoryMeta, OrganisationDirectoryAllOf, Built<OrganisationDirectory, OrganisationDirectoryBuilder> {
  OrganisationDirectory._();

  factory OrganisationDirectory([void updates(OrganisationDirectoryBuilder b)]) = _$OrganisationDirectory;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OrganisationDirectoryBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OrganisationDirectory> get serializer => _$OrganisationDirectorySerializer();
}

class _$OrganisationDirectorySerializer implements PrimitiveSerializer<OrganisationDirectory> {
  @override
  final Iterable<Type> types = const [OrganisationDirectory, _$OrganisationDirectory];

  @override
  final String wireName = r'OrganisationDirectory';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OrganisationDirectory object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.items != null) {
      yield r'items';
      yield serializers.serialize(
        object.items,
        specifiedType: const FullType(BuiltList, [FullType(Organisation)]),
      );
    }
    if (object.select != null) {
      yield r'select';
      yield serializers.serialize(
        object.select,
        specifiedType: const FullType(DirectoryMetaSelect),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    OrganisationDirectory object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required OrganisationDirectoryBuilder result,
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
        case r'select':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DirectoryMetaSelect),
          ) as DirectoryMetaSelect;
          result.select.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  OrganisationDirectory deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OrganisationDirectoryBuilder();
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

