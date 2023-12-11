//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/directory_meta_select.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'directory_meta.g.dart';

/// DirectoryMeta
///
/// Properties:
/// * [select] 
@BuiltValue(instantiable: false)
abstract class DirectoryMeta  {
  @BuiltValueField(wireName: r'select')
  DirectoryMetaSelect? get select;

  @BuiltValueSerializer(custom: true)
  static Serializer<DirectoryMeta> get serializer => _$DirectoryMetaSerializer();
}

class _$DirectoryMetaSerializer implements PrimitiveSerializer<DirectoryMeta> {
  @override
  final Iterable<Type> types = const [DirectoryMeta];

  @override
  final String wireName = r'DirectoryMeta';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DirectoryMeta object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    DirectoryMeta object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  DirectoryMeta deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($DirectoryMeta)) as $DirectoryMeta;
  }
}

/// a concrete implementation of [DirectoryMeta], since [DirectoryMeta] is not instantiable
@BuiltValue(instantiable: true)
abstract class $DirectoryMeta implements DirectoryMeta, Built<$DirectoryMeta, $DirectoryMetaBuilder> {
  $DirectoryMeta._();

  factory $DirectoryMeta([void Function($DirectoryMetaBuilder)? updates]) = _$$DirectoryMeta;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($DirectoryMetaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$DirectoryMeta> get serializer => _$$DirectoryMetaSerializer();
}

class _$$DirectoryMetaSerializer implements PrimitiveSerializer<$DirectoryMeta> {
  @override
  final Iterable<Type> types = const [$DirectoryMeta, _$$DirectoryMeta];

  @override
  final String wireName = r'$DirectoryMeta';

  @override
  Object serialize(
    Serializers serializers,
    $DirectoryMeta object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(DirectoryMeta))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DirectoryMetaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  $DirectoryMeta deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $DirectoryMetaBuilder();
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

