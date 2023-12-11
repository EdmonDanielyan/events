//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/page.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'single_page_response_data.g.dart';

/// SinglePageResponseData
///
/// Properties:
/// * [page] 
@BuiltValue()
abstract class SinglePageResponseData implements Built<SinglePageResponseData, SinglePageResponseDataBuilder> {
  @BuiltValueField(wireName: r'page')
  Page? get page;

  SinglePageResponseData._();

  factory SinglePageResponseData([void updates(SinglePageResponseDataBuilder b)]) = _$SinglePageResponseData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SinglePageResponseDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SinglePageResponseData> get serializer => _$SinglePageResponseDataSerializer();
}

class _$SinglePageResponseDataSerializer implements PrimitiveSerializer<SinglePageResponseData> {
  @override
  final Iterable<Type> types = const [SinglePageResponseData, _$SinglePageResponseData];

  @override
  final String wireName = r'SinglePageResponseData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SinglePageResponseData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.page != null) {
      yield r'page';
      yield serializers.serialize(
        object.page,
        specifiedType: const FullType(Page),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SinglePageResponseData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SinglePageResponseDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'page':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Page),
          ) as Page;
          result.page.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SinglePageResponseData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SinglePageResponseDataBuilder();
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

