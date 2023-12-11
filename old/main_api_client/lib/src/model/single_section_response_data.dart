//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/page.dart';
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/page_section.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'single_section_response_data.g.dart';

/// SingleSectionResponseData
///
/// Properties:
/// * [section] 
/// * [pages] 
@BuiltValue()
abstract class SingleSectionResponseData implements Built<SingleSectionResponseData, SingleSectionResponseDataBuilder> {
  @BuiltValueField(wireName: r'section')
  PageSection? get section;

  @BuiltValueField(wireName: r'pages')
  BuiltList<Page>? get pages;

  SingleSectionResponseData._();

  factory SingleSectionResponseData([void updates(SingleSectionResponseDataBuilder b)]) = _$SingleSectionResponseData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SingleSectionResponseDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SingleSectionResponseData> get serializer => _$SingleSectionResponseDataSerializer();
}

class _$SingleSectionResponseDataSerializer implements PrimitiveSerializer<SingleSectionResponseData> {
  @override
  final Iterable<Type> types = const [SingleSectionResponseData, _$SingleSectionResponseData];

  @override
  final String wireName = r'SingleSectionResponseData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SingleSectionResponseData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.section != null) {
      yield r'section';
      yield serializers.serialize(
        object.section,
        specifiedType: const FullType(PageSection),
      );
    }
    if (object.pages != null) {
      yield r'pages';
      yield serializers.serialize(
        object.pages,
        specifiedType: const FullType(BuiltList, [FullType(Page)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SingleSectionResponseData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SingleSectionResponseDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'section':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PageSection),
          ) as PageSection;
          result.section.replace(valueDes);
          break;
        case r'pages':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Page)]),
          ) as BuiltList<Page>;
          result.pages.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SingleSectionResponseData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SingleSectionResponseDataBuilder();
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

