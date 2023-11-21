//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/page_section.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'list_section_response_data.g.dart';

/// ListSectionResponseData
///
/// Properties:
/// * [sections] 
@BuiltValue()
abstract class ListSectionResponseData implements Built<ListSectionResponseData, ListSectionResponseDataBuilder> {
  @BuiltValueField(wireName: r'sections')
  BuiltList<PageSection>? get sections;

  ListSectionResponseData._();

  factory ListSectionResponseData([void updates(ListSectionResponseDataBuilder b)]) = _$ListSectionResponseData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ListSectionResponseDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ListSectionResponseData> get serializer => _$ListSectionResponseDataSerializer();
}

class _$ListSectionResponseDataSerializer implements PrimitiveSerializer<ListSectionResponseData> {
  @override
  final Iterable<Type> types = const [ListSectionResponseData, _$ListSectionResponseData];

  @override
  final String wireName = r'ListSectionResponseData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ListSectionResponseData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.sections != null) {
      yield r'sections';
      yield serializers.serialize(
        object.sections,
        specifiedType: const FullType(BuiltList, [FullType(PageSection)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ListSectionResponseData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ListSectionResponseDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'sections':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(PageSection)]),
          ) as BuiltList<PageSection>;
          result.sections.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ListSectionResponseData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ListSectionResponseDataBuilder();
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

