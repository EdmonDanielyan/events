//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'news_tab.g.dart';

/// Рубрика новостей
///
/// Properties:
/// * [code] - Символьный код для последующего запроса фильтрованных результатов
/// * [title] - Отображаемое название
/// * [visible] - Отображать ли в списке табов.
/// * [new_] - Количество непрочитанных записей (зарезервировано, пока не реализовано).
@BuiltValue()
abstract class NewsTab implements Built<NewsTab, NewsTabBuilder> {
  /// Символьный код для последующего запроса фильтрованных результатов
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Отображаемое название
  @BuiltValueField(wireName: r'title')
  String get title;

  /// Отображать ли в списке табов.
  @BuiltValueField(wireName: r'visible')
  bool? get visible;

  /// Количество непрочитанных записей (зарезервировано, пока не реализовано).
  @BuiltValueField(wireName: r'new')
  int? get new_;

  NewsTab._();

  factory NewsTab([void updates(NewsTabBuilder b)]) = _$NewsTab;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NewsTabBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NewsTab> get serializer => _$NewsTabSerializer();
}

class _$NewsTabSerializer implements PrimitiveSerializer<NewsTab> {
  @override
  final Iterable<Type> types = const [NewsTab, _$NewsTab];

  @override
  final String wireName = r'NewsTab';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NewsTab object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    if (object.visible != null) {
      yield r'visible';
      yield serializers.serialize(
        object.visible,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.new_ != null) {
      yield r'new';
      yield serializers.serialize(
        object.new_,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    NewsTab object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required NewsTabBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'visible':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.visible = valueDes;
          break;
        case r'new':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.new_ = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  NewsTab deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NewsTabBuilder();
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

