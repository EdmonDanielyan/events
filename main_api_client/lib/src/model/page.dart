//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/web_view_page.dart';
import 'package:openapi/src/model/text_page.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/one_of.dart';

part 'page.g.dart';

/// Page
///
/// Properties:
/// * [type] 
/// * [id] 
/// * [code] 
/// * [name] 
/// * [preview] 
/// * [detail] 
/// * [iconUrl] 
/// * [url] 
@BuiltValue()
abstract class Page implements Built<Page, PageBuilder> {
  /// One Of [TextPage], [WebViewPage]
  OneOf get oneOf;

  static const String discriminatorFieldName = r'type';

  static const Map<String, Type> discriminatorMapping = {
    r'text': TextPage,
    r'webview': WebViewPage,
  };

  Page._();

  factory Page([void updates(PageBuilder b)]) = _$Page;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PageBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Page> get serializer => _$PageSerializer();
}

extension PageDiscriminatorExt on Page {
    String? get discriminatorValue {
        if (this is TextPage) {
            return r'text';
        }
        if (this is WebViewPage) {
            return r'webview';
        }
        return null;
    }
}
extension PageBuilderDiscriminatorExt on PageBuilder {
    String? get discriminatorValue {
        if (this is TextPageBuilder) {
            return r'text';
        }
        if (this is WebViewPageBuilder) {
            return r'webview';
        }
        return null;
    }
}

class _$PageSerializer implements PrimitiveSerializer<Page> {
  @override
  final Iterable<Type> types = const [Page, _$Page];

  @override
  final String wireName = r'Page';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Page object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
  }

  @override
  Object serialize(
    Serializers serializers,
    Page object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final oneOf = object.oneOf;
    return serializers.serialize(oneOf.value, specifiedType: FullType(oneOf.valueType))!;
  }

  @override
  Page deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PageBuilder();
    Object? oneOfDataSrc;
    final serializedList = (serialized as Iterable<Object?>).toList();
    final discIndex = serializedList.indexOf(Page.discriminatorFieldName) + 1;
    final discValue = serializers.deserialize(serializedList[discIndex], specifiedType: FullType(String)) as String;
    oneOfDataSrc = serialized;
    final oneOfTypes = [TextPage, WebViewPage, ];
    Object oneOfResult;
    Type oneOfType;
    switch (discValue) {
      case r'text':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(TextPage),
        ) as TextPage;
        oneOfType = TextPage;
        break;
      case r'webview':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(WebViewPage),
        ) as WebViewPage;
        oneOfType = WebViewPage;
        break;
      default:
        throw UnsupportedError("Couldn't deserialize oneOf for the discriminator value: ${discValue}");
    }
    result.oneOf = OneOfDynamic(typeIndex: oneOfTypes.indexOf(oneOfType), types: oneOfTypes, value: oneOfResult);
    return result.build();
  }
}

