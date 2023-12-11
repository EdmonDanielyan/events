//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/uni_sub_request_visitor_new.dart';
import 'package:openapi/src/model/date.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/one_of.dart';

part 'uni_sub_request_visitor.g.dart';

/// UniSubRequestVisitor
///
/// Properties:
/// * [name] - Имя
/// * [type] - Тип
/// * [birthday] - Дата рождения
/// * [option] - ID выбранной опции, если опции выбираются для каждого посетителя индивидуально
@BuiltValue()
abstract class UniSubRequestVisitor implements Built<UniSubRequestVisitor, UniSubRequestVisitorBuilder> {
  /// One Of [UniSubRequestVisitorNew]
  OneOf get oneOf;

  UniSubRequestVisitor._();

  factory UniSubRequestVisitor([void updates(UniSubRequestVisitorBuilder b)]) = _$UniSubRequestVisitor;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UniSubRequestVisitorBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UniSubRequestVisitor> get serializer => _$UniSubRequestVisitorSerializer();
}

class _$UniSubRequestVisitorSerializer implements PrimitiveSerializer<UniSubRequestVisitor> {
  @override
  final Iterable<Type> types = const [UniSubRequestVisitor, _$UniSubRequestVisitor];

  @override
  final String wireName = r'UniSubRequestVisitor';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UniSubRequestVisitor object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
  }

  @override
  Object serialize(
    Serializers serializers,
    UniSubRequestVisitor object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final oneOf = object.oneOf;
    return serializers.serialize(oneOf.value, specifiedType: FullType(oneOf.valueType))!;
  }

  @override
  UniSubRequestVisitor deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UniSubRequestVisitorBuilder();
    Object? oneOfDataSrc;
    final targetType = const FullType(OneOf, [FullType(UniSubRequestVisitorNew), FullType(UniSubRequestVisitorNew), ]);
    oneOfDataSrc = serialized;
    result.oneOf = serializers.deserialize(oneOfDataSrc, specifiedType: targetType) as OneOf;
    return result.build();
  }
}

