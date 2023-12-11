//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/page.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'list_page_response_data.g.dart';

/// ListPageResponseData
///
/// Properties:
/// * [pages] 
@BuiltValue()
abstract class ListPageResponseData implements Built<ListPageResponseData, ListPageResponseDataBuilder> {
  @BuiltValueField(wireName: r'pages')
  BuiltList<Page>? get pages;

  ListPageResponseData._();

  factory ListPageResponseData([void updates(ListPageResponseDataBuilder b)]) = _$ListPageResponseData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ListPageResponseDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ListPageResponseData> get serializer => _$ListPageResponseDataSerializer();
}

class _$ListPageResponseDataSerializer implements PrimitiveSerializer<ListPageResponseData> {
  @override
  final Iterable<Type> types = const [ListPageResponseData, _$ListPageResponseData];

  @override
  final String wireName = r'ListPageResponseData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ListPageResponseData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    ListPageResponseData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ListPageResponseDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  ListPageResponseData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ListPageResponseDataBuilder();
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

