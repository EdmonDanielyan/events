//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'news_property_by_id.g.dart';

/// NewsPropertyById
///
/// Properties:
/// * [id] 
/// * [title] 
/// * [dateCreate] 
/// * [commentCount] 
/// * [viewCount] 
/// * [likeCount] 
/// * [detailText] 
/// * [imageLinks] 
/// * [videoLinks] 
/// * [liked] 
@BuiltValue()
abstract class NewsPropertyById implements Built<NewsPropertyById, NewsPropertyByIdBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'date_create')
  DateTime? get dateCreate;

  @BuiltValueField(wireName: r'comment_count')
  int? get commentCount;

  @BuiltValueField(wireName: r'view_count')
  int? get viewCount;

  @BuiltValueField(wireName: r'like_count')
  int? get likeCount;

  @BuiltValueField(wireName: r'detail_text')
  String? get detailText;

  @BuiltValueField(wireName: r'image_links')
  BuiltList<String?>? get imageLinks;

  @BuiltValueField(wireName: r'video_links')
  BuiltList<String?>? get videoLinks;

  @BuiltValueField(wireName: r'liked')
  bool? get liked;

  NewsPropertyById._();

  factory NewsPropertyById([void updates(NewsPropertyByIdBuilder b)]) = _$NewsPropertyById;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NewsPropertyByIdBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NewsPropertyById> get serializer => _$NewsPropertyByIdSerializer();
}

class _$NewsPropertyByIdSerializer implements PrimitiveSerializer<NewsPropertyById> {
  @override
  final Iterable<Type> types = const [NewsPropertyById, _$NewsPropertyById];

  @override
  final String wireName = r'NewsPropertyById';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NewsPropertyById object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType(String),
      );
    }
    if (object.dateCreate != null) {
      yield r'date_create';
      yield serializers.serialize(
        object.dateCreate,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.commentCount != null) {
      yield r'comment_count';
      yield serializers.serialize(
        object.commentCount,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.viewCount != null) {
      yield r'view_count';
      yield serializers.serialize(
        object.viewCount,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.likeCount != null) {
      yield r'like_count';
      yield serializers.serialize(
        object.likeCount,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.detailText != null) {
      yield r'detail_text';
      yield serializers.serialize(
        object.detailText,
        specifiedType: const FullType(String),
      );
    }
    if (object.imageLinks != null) {
      yield r'image_links';
      yield serializers.serialize(
        object.imageLinks,
        specifiedType: const FullType(BuiltList, [FullType.nullable(String)]),
      );
    }
    if (object.videoLinks != null) {
      yield r'video_links';
      yield serializers.serialize(
        object.videoLinks,
        specifiedType: const FullType(BuiltList, [FullType.nullable(String)]),
      );
    }
    if (object.liked != null) {
      yield r'liked';
      yield serializers.serialize(
        object.liked,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    NewsPropertyById object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required NewsPropertyByIdBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'date_create':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.dateCreate = valueDes;
          break;
        case r'comment_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.commentCount = valueDes;
          break;
        case r'view_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.viewCount = valueDes;
          break;
        case r'like_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.likeCount = valueDes;
          break;
        case r'detail_text':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.detailText = valueDes;
          break;
        case r'image_links':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType.nullable(String)]),
          ) as BuiltList<String?>;
          result.imageLinks.replace(valueDes);
          break;
        case r'video_links':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType.nullable(String)]),
          ) as BuiltList<String?>;
          result.videoLinks.replace(valueDes);
          break;
        case r'liked':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.liked = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  NewsPropertyById deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NewsPropertyByIdBuilder();
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

