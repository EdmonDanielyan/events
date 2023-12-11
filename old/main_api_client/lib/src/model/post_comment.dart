//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_comment.g.dart';

/// PostComment
///
/// Properties:
/// * [newsId] 
/// * [parentId] 
/// * [text] 
@BuiltValue()
abstract class PostComment implements Built<PostComment, PostCommentBuilder> {
  @BuiltValueField(wireName: r'news_id')
  int get newsId;

  @BuiltValueField(wireName: r'parent_id')
  int get parentId;

  @BuiltValueField(wireName: r'text')
  String get text;

  PostComment._();

  factory PostComment([void updates(PostCommentBuilder b)]) = _$PostComment;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PostCommentBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PostComment> get serializer => _$PostCommentSerializer();
}

class _$PostCommentSerializer implements PrimitiveSerializer<PostComment> {
  @override
  final Iterable<Type> types = const [PostComment, _$PostComment];

  @override
  final String wireName = r'PostComment';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PostComment object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'news_id';
    yield serializers.serialize(
      object.newsId,
      specifiedType: const FullType(int),
    );
    yield r'parent_id';
    yield serializers.serialize(
      object.parentId,
      specifiedType: const FullType(int),
    );
    yield r'text';
    yield serializers.serialize(
      object.text,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PostComment object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PostCommentBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'news_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.newsId = valueDes;
          break;
        case r'parent_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.parentId = valueDes;
          break;
        case r'text':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.text = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PostComment deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PostCommentBuilder();
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

