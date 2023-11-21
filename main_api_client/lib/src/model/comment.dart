//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'comment.g.dart';

/// Comment
///
/// Properties:
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
@BuiltValue(instantiable: false)
abstract class Comment  {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'date_create')
  DateTime get dateCreate;

  @BuiltValueField(wireName: r'author_id')
  int get authorId;

  @BuiltValueField(wireName: r'post_id')
  int get postId;

  @BuiltValueField(wireName: r'post_text')
  String get postText;

  @BuiltValueField(wireName: r'user_name')
  String? get userName;

  @BuiltValueField(wireName: r'user_last_name')
  String? get userLastName;

  @BuiltValueField(wireName: r'likes')
  int? get likes;

  @BuiltValueField(wireName: r'liked_by_user')
  bool? get likedByUser;

  @BuiltValueField(wireName: r'avatar')
  String? get avatar;

  @BuiltValueField(wireName: r'allow_edit')
  bool? get allowEdit;

  @BuiltValueField(wireName: r'allow_delete')
  bool? get allowDelete;

  @BuiltValueSerializer(custom: true)
  static Serializer<Comment> get serializer => _$CommentSerializer();
}

class _$CommentSerializer implements PrimitiveSerializer<Comment> {
  @override
  final Iterable<Type> types = const [Comment];

  @override
  final String wireName = r'Comment';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Comment object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
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
    yield r'post_id';
    yield serializers.serialize(
      object.postId,
      specifiedType: const FullType(int),
    );
    yield r'post_text';
    yield serializers.serialize(
      object.postText,
      specifiedType: const FullType(String),
    );
    yield r'user_name';
    yield object.userName == null ? null : serializers.serialize(
      object.userName,
      specifiedType: const FullType.nullable(String),
    );
    yield r'user_last_name';
    yield object.userLastName == null ? null : serializers.serialize(
      object.userLastName,
      specifiedType: const FullType.nullable(String),
    );
    if (object.likes != null) {
      yield r'likes';
      yield serializers.serialize(
        object.likes,
        specifiedType: const FullType(int),
      );
    }
    if (object.likedByUser != null) {
      yield r'liked_by_user';
      yield serializers.serialize(
        object.likedByUser,
        specifiedType: const FullType(bool),
      );
    }
    if (object.avatar != null) {
      yield r'avatar';
      yield serializers.serialize(
        object.avatar,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.allowEdit != null) {
      yield r'allow_edit';
      yield serializers.serialize(
        object.allowEdit,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.allowDelete != null) {
      yield r'allow_delete';
      yield serializers.serialize(
        object.allowDelete,
        specifiedType: const FullType.nullable(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Comment object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  Comment deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($Comment)) as $Comment;
  }
}

/// a concrete implementation of [Comment], since [Comment] is not instantiable
@BuiltValue(instantiable: true)
abstract class $Comment implements Comment, Built<$Comment, $CommentBuilder> {
  $Comment._();

  factory $Comment([void Function($CommentBuilder)? updates]) = _$$Comment;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($CommentBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$Comment> get serializer => _$$CommentSerializer();
}

class _$$CommentSerializer implements PrimitiveSerializer<$Comment> {
  @override
  final Iterable<Type> types = const [$Comment, _$$Comment];

  @override
  final String wireName = r'$Comment';

  @override
  Object serialize(
    Serializers serializers,
    $Comment object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(Comment))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CommentBuilder result,
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
        case r'post_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.postId = valueDes;
          break;
        case r'post_text':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.postText = valueDes;
          break;
        case r'user_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.userName = valueDes;
          break;
        case r'user_last_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.userLastName = valueDes;
          break;
        case r'likes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.likes = valueDes;
          break;
        case r'liked_by_user':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.likedByUser = valueDes;
          break;
        case r'avatar':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.avatar = valueDes;
          break;
        case r'allow_edit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.allowEdit = valueDes;
          break;
        case r'allow_delete':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.allowDelete = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  $Comment deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $CommentBuilder();
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

