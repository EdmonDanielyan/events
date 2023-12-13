// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_parent.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CommentParent extends CommentParent {
  @override
  final BuiltList<Comment>? children;
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
  final String? userName;
  @override
  final String? userLastName;
  @override
  final int? likes;
  @override
  final bool? likedByUser;
  @override
  final String? avatar;
  @override
  final bool? allowEdit;
  @override
  final bool? allowDelete;

  factory _$CommentParent([void Function(CommentParentBuilder)? updates]) =>
      (new CommentParentBuilder()..update(updates))._build();

  _$CommentParent._(
      {this.children,
      required this.id,
      required this.dateCreate,
      required this.authorId,
      required this.postId,
      required this.postText,
      this.userName,
      this.userLastName,
      this.likes,
      this.likedByUser,
      this.avatar,
      this.allowEdit,
      this.allowDelete})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'CommentParent', 'id');
    BuiltValueNullFieldError.checkNotNull(
        dateCreate, r'CommentParent', 'dateCreate');
    BuiltValueNullFieldError.checkNotNull(
        authorId, r'CommentParent', 'authorId');
    BuiltValueNullFieldError.checkNotNull(postId, r'CommentParent', 'postId');
    BuiltValueNullFieldError.checkNotNull(
        postText, r'CommentParent', 'postText');
  }

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
    implements Builder<CommentParent, CommentParentBuilder>, CommentBuilder {
  _$CommentParent? _$v;

  ListBuilder<Comment>? _children;
  ListBuilder<Comment> get children =>
      _$this._children ??= new ListBuilder<Comment>();
  set children(covariant ListBuilder<Comment>? children) =>
      _$this._children = children;

  int? _id;
  int? get id => _$this._id;
  set id(covariant int? id) => _$this._id = id;

  DateTime? _dateCreate;
  DateTime? get dateCreate => _$this._dateCreate;
  set dateCreate(covariant DateTime? dateCreate) =>
      _$this._dateCreate = dateCreate;

  int? _authorId;
  int? get authorId => _$this._authorId;
  set authorId(covariant int? authorId) => _$this._authorId = authorId;

  int? _postId;
  int? get postId => _$this._postId;
  set postId(covariant int? postId) => _$this._postId = postId;

  String? _postText;
  String? get postText => _$this._postText;
  set postText(covariant String? postText) => _$this._postText = postText;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(covariant String? userName) => _$this._userName = userName;

  String? _userLastName;
  String? get userLastName => _$this._userLastName;
  set userLastName(covariant String? userLastName) =>
      _$this._userLastName = userLastName;

  int? _likes;
  int? get likes => _$this._likes;
  set likes(covariant int? likes) => _$this._likes = likes;

  bool? _likedByUser;
  bool? get likedByUser => _$this._likedByUser;
  set likedByUser(covariant bool? likedByUser) =>
      _$this._likedByUser = likedByUser;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(covariant String? avatar) => _$this._avatar = avatar;

  bool? _allowEdit;
  bool? get allowEdit => _$this._allowEdit;
  set allowEdit(covariant bool? allowEdit) => _$this._allowEdit = allowEdit;

  bool? _allowDelete;
  bool? get allowDelete => _$this._allowDelete;
  set allowDelete(covariant bool? allowDelete) =>
      _$this._allowDelete = allowDelete;

  CommentParentBuilder() {
    CommentParent._defaults(this);
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
  void replace(covariant CommentParent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommentParent;
  }

  @override
  void update(void Function(CommentParentBuilder)? updates) {
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
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'CommentParent', 'id'),
              dateCreate: BuiltValueNullFieldError.checkNotNull(
                  dateCreate, r'CommentParent', 'dateCreate'),
              authorId: BuiltValueNullFieldError.checkNotNull(
                  authorId, r'CommentParent', 'authorId'),
              postId: BuiltValueNullFieldError.checkNotNull(
                  postId, r'CommentParent', 'postId'),
              postText: BuiltValueNullFieldError.checkNotNull(
                  postText, r'CommentParent', 'postText'),
              userName: userName,
              userLastName: userLastName,
              likes: likes,
              likedByUser: likedByUser,
              avatar: avatar,
              allowEdit: allowEdit,
              allowDelete: allowDelete);
    } catch (_) {
      late String _$failedField;
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
