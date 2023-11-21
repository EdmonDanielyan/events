//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/comment.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'comment_parent.g.dart';

/// CommentParent
///
/// Properties:
/// * [children] 
/// * [id] 
/// * [dateCreate] 
/// * [authorId] 
/// * [postId] 
/// * [postText] 
/// * [userName] 
/// * [userLastName] 
/// * [likes] 
/// * [likedByUser] 
/// * [avatar] 
/// * [allowEdit] 
/// * [allowDelete] 
@BuiltValue()
abstract class CommentParent implements Comment, Built<CommentParent, CommentParentBuilder> {
  @BuiltValueField(wireName: r'children')
  BuiltList<Comment>? get children;

  CommentParent._();

  factory CommentParent([void updates(CommentParentBuilder b)]) = _$CommentParent;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CommentParentBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CommentParent> get serializer => _$CommentParentSerializer();
}

class _$CommentParentSerializer implements PrimitiveSerializer<CommentParent> {
  @override
  final Iterable<Type> types = const [CommentParent, _$CommentParent];

  @override
  final String wireName = r'CommentParent';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CommentParent object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.allowDelete != null) {
      yield r'allow_delete';
      yield serializers.serialize(
        object.allowDelete,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.likedByUser != null) {
      yield r'liked_by_user';
      yield serializers.serialize(
        object.likedByUser,
        specifiedType: const FullType(bool),
      );
    }
    yield r'post_id';
    yield serializers.serialize(
      object.postId,
      specifiedType: const FullType(int),
    );
    if (object.avatar != null) {
      yield r'avatar';
      yield serializers.serialize(
        object.avatar,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'date_create';
    yield serializers.serialize(
      object.dateCreate,
      specifiedType: const FullType(DateTime),
    );
    yield r'author_id';
    yield serializers.serialize(
      object.authorId,
      specifiedType: const FullType(int),
    );
    yield r'user_name';
    yield object.userName == null ? null : serializers.serialize(
      object.userName,
      specifiedType: const FullType.nullable(String),
    );
    yield r'post_text';
    yield serializers.serialize(
      object.postText,
      specifiedType: const FullType(String),
    );
    if (object.children != null) {
      yield r'children';
      yield serializers.serialize(
        object.children,
        specifiedType: const FullType(BuiltList, [FullType(Comment)]),
      );
    }
    yield r'user_last_name';
    yield object.userLastName == null ? null : serializers.serialize(
      object.userLastName,
      specifiedType: const FullType.nullable(String),
    );
    if (object.allowEdit != null) {
      yield r'allow_edit';
      yield serializers.serialize(
        object.allowEdit,
        specifiedType: const FullType.nullable(bool),
      );
    }
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    if (object.likes != null) {
      yield r'likes';
      yield serializers.serialize(
        object.likes,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CommentParent object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CommentParentBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'allow_delete':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.allowDelete = valueDes;
          break;
        case r'liked_by_user':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.likedByUser = valueDes;
          break;
        case r'post_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.postId = valueDes;
          break;
        case r'avatar':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.avatar = valueDes;
          break;
        case r'date_create':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.dateCreate = valueDes;
          break;
        case r'author_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.authorId = valueDes;
          break;
        case r'user_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.userName = valueDes;
          break;
        case r'post_text':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.postText = valueDes;
          break;
        case r'children':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Comment)]),
          ) as BuiltList<Comment>;
          result.children.replace(valueDes);
          break;
        case r'user_last_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.userLastName = valueDes;
          break;
        case r'allow_edit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.allowEdit = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'likes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.likes = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CommentParent deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CommentParentBuilder();
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

