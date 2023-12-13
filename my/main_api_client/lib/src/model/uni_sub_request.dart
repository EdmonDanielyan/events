//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/uni_sub_request_visitor.dart';
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/uni_sub_request_field.dart';
import 'package:openapi/src/model/uni_sub_request_option.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'uni_sub_request.g.dart';

/// Запрос на универсальную запись
///
/// Properties:
/// * [version] - Версия формата, всегда 1
/// * [fields] - Поля
/// * [options] - Выбранные опции
/// * [children] - Дети
/// * [visitors] - Родственники и 3-е лица
@BuiltValue()
abstract class UniSubRequest implements Built<UniSubRequest, UniSubRequestBuilder> {
  /// Версия формата, всегда 1
  @BuiltValueField(wireName: r'version')
  UniSubRequestVersionEnum? get version;
  // enum versionEnum {  1,  };

  /// Поля
  @BuiltValueField(wireName: r'fields')
  BuiltList<UniSubRequestField>? get fields;

  /// Выбранные опции
  @BuiltValueField(wireName: r'options')
  BuiltList<UniSubRequestOption>? get options;

  /// Дети
  @BuiltValueField(wireName: r'children')
  BuiltList<UniSubRequestVisitor>? get children;

  /// Родственники и 3-е лица
  @BuiltValueField(wireName: r'visitors')
  BuiltList<UniSubRequestVisitor>? get visitors;

  UniSubRequest._();

  factory UniSubRequest([void updates(UniSubRequestBuilder b)]) = _$UniSubRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UniSubRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UniSubRequest> get serializer => _$UniSubRequestSerializer();
}

class _$UniSubRequestSerializer implements PrimitiveSerializer<UniSubRequest> {
  @override
  final Iterable<Type> types = const [UniSubRequest, _$UniSubRequest];

  @override
  final String wireName = r'UniSubRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UniSubRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.version != null) {
      yield r'version';
      yield serializers.serialize(
        object.version,
        specifiedType: const FullType(UniSubRequestVersionEnum),
      );
    }
    if (object.fields != null) {
      yield r'fields';
      yield serializers.serialize(
        object.fields,
        specifiedType: const FullType.nullable(BuiltList, [FullType(UniSubRequestField)]),
      );
    }
    if (object.options != null) {
      yield r'options';
      yield serializers.serialize(
        object.options,
        specifiedType: const FullType.nullable(BuiltList, [FullType(UniSubRequestOption)]),
      );
    }
    if (object.children != null) {
      yield r'children';
      yield serializers.serialize(
        object.children,
        specifiedType: const FullType.nullable(BuiltList, [FullType(UniSubRequestVisitor)]),
      );
    }
    if (object.visitors != null) {
      yield r'visitors';
      yield serializers.serialize(
        object.visitors,
        specifiedType: const FullType.nullable(BuiltList, [FullType(UniSubRequestVisitor)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UniSubRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UniSubRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UniSubRequestVersionEnum),
          ) as UniSubRequestVersionEnum;
          result.version = valueDes;
          break;
        case r'fields':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(UniSubRequestField)]),
          ) as BuiltList<UniSubRequestField>?;
          if (valueDes == null) continue;
          result.fields.replace(valueDes);
          break;
        case r'options':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(UniSubRequestOption)]),
          ) as BuiltList<UniSubRequestOption>?;
          if (valueDes == null) continue;
          result.options.replace(valueDes);
          break;
        case r'children':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(UniSubRequestVisitor)]),
          ) as BuiltList<UniSubRequestVisitor>?;
          if (valueDes == null) continue;
          result.children.replace(valueDes);
          break;
        case r'visitors':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(UniSubRequestVisitor)]),
          ) as BuiltList<UniSubRequestVisitor>?;
          if (valueDes == null) continue;
          result.visitors.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UniSubRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UniSubRequestBuilder();
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

class UniSubRequestVersionEnum extends EnumClass {

  /// Версия формата, всегда 1
  @BuiltValueEnumConst(wireNumber: 1)
  static const UniSubRequestVersionEnum number1 = _$uniSubRequestVersionEnum_number1;

  static Serializer<UniSubRequestVersionEnum> get serializer => _$uniSubRequestVersionEnumSerializer;

  const UniSubRequestVersionEnum._(String name): super(name);

  static BuiltSet<UniSubRequestVersionEnum> get values => _$uniSubRequestVersionEnumValues;
  static UniSubRequestVersionEnum valueOf(String name) => _$uniSubRequestVersionEnumValueOf(name);
}

