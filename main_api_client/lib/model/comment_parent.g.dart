// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'comment_parent.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CommentParent> _$commentParentSerializer =
    new _$CommentParentSerializer();

class _$CommentParentSerializer implements StructuredSerializer<CommentParent> {
  @override
  final Iterable<Type> types = const [CommentParent, _$CommentParent];
  @override
  final String wireName = 'CommentParent';

  @override
  Iterable<Object> serialize(Serializers serializers, CommentParent object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.children;
    if (value != null) {
      result
        ..add('children')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Comment)])));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.dateCreate;
    if (value != null) {
      result
        ..add('date_create')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.authorId;
    if (value != null) {
      result
        ..add('author_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.postId;
    if (value != null) {
      result
        ..add('post_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.postText;
    if (value != null) {
      result
        ..add('post_text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userName;
    if (value != null) {
      result
        ..add('user_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userLastName;
    if (value != null) {
      result
        ..add('user_last_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.likes;
    if (value != null) {
      result
        ..add('likes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.likedByUser;
    if (value != null) {
      result
        ..add('liked_by_user')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.avatar;
    if (value != null) {
      result
        ..add('avatar')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.allowEdit;
    if (value != null) {
      result
        ..add('allow_edit')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.allowDelete;
    if (value != null) {
      result
        ..add('allow_delete')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  CommentParent deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CommentParentBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'children':
          result.children.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Comment)]))
              as BuiltList<Object>);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'date_create':
          result.dateCreate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'author_id':
          result.authorId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'post_id':
          result.postId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'post_text':
          result.postText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user_name':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user_last_name':
          result.userLastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'likes':
          result.likes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'liked_by_user':
          result.likedByUser = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'avatar':
          result.avatar = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'allow_edit':
          result.allowEdit = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'allow_delete':
          result.allowDelete = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$CommentParent extends CommentParent {
  @override
  final BuiltList<Comment> children;
  @override
  final int id;
  @override
  final DateTime dateCreate;
  @override
  final int authorId;
  @override
  final int postId;
  @override
  final String postText;
  @override
  final String userName;
  @override
  final String userLastName;
  @override
  final int likes;
  @override
  final bool likedByUser;
  @override
  final String avatar;
  @override
  final bool allowEdit;
  @override
  final bool allowDelete;

  factory _$CommentParent([void Function(CommentParentBuilder) updates]) =>
      (new CommentParentBuilder()..update(updates))._build();

  _$CommentParent._(
      {this.children,
      this.id,
      this.dateCreate,
      this.authorId,
      this.postId,
      this.postText,
      this.userName,
      this.userLastName,
      this.likes,
      this.likedByUser,
      this.avatar,
      this.allowEdit,
      this.allowDelete})
      : super._();

  @override
  CommentParent rebuild(void Function(CommentParentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentParentBuilder toBuilder() => new CommentParentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommentParent &&
        children == other.children &&
        id == other.id &&
        dateCreate == other.dateCreate &&
        authorId == other.authorId &&
        postId == other.postId &&
        postText == other.postText &&
        userName == other.userName &&
        userLastName == other.userLastName &&
        likes == other.likes &&
        likedByUser == other.likedByUser &&
        avatar == other.avatar &&
        allowEdit == other.allowEdit &&
        allowDelete == other.allowDelete;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, children.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, dateCreate.hashCode);
    _$hash = $jc(_$hash, authorId.hashCode);
    _$hash = $jc(_$hash, postId.hashCode);
    _$hash = $jc(_$hash, postText.hashCode);
    _$hash = $jc(_$hash, userName.hashCode);
    _$hash = $jc(_$hash, userLastName.hashCode);
    _$hash = $jc(_$hash, likes.hashCode);
    _$hash = $jc(_$hash, likedByUser.hashCode);
    _$hash = $jc(_$hash, avatar.hashCode);
    _$hash = $jc(_$hash, allowEdit.hashCode);
    _$hash = $jc(_$hash, allowDelete.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CommentParent')
          ..add('children', children)
          ..add('id', id)
          ..add('dateCreate', dateCreate)
          ..add('authorId', authorId)
          ..add('postId', postId)
          ..add('postText', postText)
          ..add('userName', userName)
          ..add('userLastName', userLastName)
          ..add('likes', likes)
          ..add('likedByUser', likedByUser)
          ..add('avatar', avatar)
          ..add('allowEdit', allowEdit)
          ..add('allowDelete', allowDelete))
        .toString();
  }
}

class CommentParentBuilder
    implements Builder<CommentParent, CommentParentBuilder> {
  _$CommentParent _$v;

  ListBuilder<Comment> _children;
  ListBuilder<Comment> get children =>
      _$this._children ??= new ListBuilder<Comment>();
  set children(ListBuilder<Comment> children) => _$this._children = children;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  DateTime _dateCreate;
  DateTime get dateCreate => _$this._dateCreate;
  set dateCreate(DateTime dateCreate) => _$this._dateCreate = dateCreate;

  int _authorId;
  int get authorId => _$this._authorId;
  set authorId(int authorId) => _$this._authorId = authorId;

  int _postId;
  int get postId => _$this._postId;
  set postId(int postId) => _$this._postId = postId;

  String _postText;
  String get postText => _$this._postText;
  set postText(String postText) => _$this._postText = postText;

  String _userName;
  String get userName => _$this._userName;
  set userName(String userName) => _$this._userName = userName;

  String _userLastName;
  String get userLastName => _$this._userLastName;
  set userLastName(String userLastName) => _$this._userLastName = userLastName;

  int _likes;
  int get likes => _$this._likes;
  set likes(int likes) => _$this._likes = likes;

  bool _likedByUser;
  bool get likedByUser => _$this._likedByUser;
  set likedByUser(bool likedByUser) => _$this._likedByUser = likedByUser;

  String _avatar;
  String get avatar => _$this._avatar;
  set avatar(String avatar) => _$this._avatar = avatar;

  bool _allowEdit;
  bool get allowEdit => _$this._allowEdit;
  set allowEdit(bool allowEdit) => _$this._allowEdit = allowEdit;

  bool _allowDelete;
  bool get allowDelete => _$this._allowDelete;
  set allowDelete(bool allowDelete) => _$this._allowDelete = allowDelete;

  CommentParentBuilder() {
    CommentParent._initializeBuilder(this);
  }

  CommentParentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _children = $v.children?.toBuilder();
      _id = $v.id;
      _dateCreate = $v.dateCreate;
      _authorId = $v.authorId;
      _postId = $v.postId;
      _postText = $v.postText;
      _userName = $v.userName;
      _userLastName = $v.userLastName;
      _likes = $v.likes;
      _likedByUser = $v.likedByUser;
      _avatar = $v.avatar;
      _allowEdit = $v.allowEdit;
      _allowDelete = $v.allowDelete;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommentParent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommentParent;
  }

  @override
  void update(void Function(CommentParentBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  CommentParent build() => _build();

  _$CommentParent _build() {
    _$CommentParent _$result;
    try {
      _$result = _$v ??
          new _$CommentParent._(
              children: _children?.build(),
              id: id,
              dateCreate: dateCreate,
              authorId: authorId,
              postId: postId,
              postText: postText,
              userName: userName,
              userLastName: userLastName,
              likes: likes,
              likedByUser: likedByUser,
              avatar: avatar,
              allowEdit: allowEdit,
              allowDelete: allowDelete);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'children';
        _children?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CommentParent', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
