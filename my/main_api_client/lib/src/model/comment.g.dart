// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class CommentBuilder {
  void replace(Comment other);
  void update(void Function(CommentBuilder) updates);
  int? get id;
  set id(int? id);

  DateTime? get dateCreate;
  set dateCreate(DateTime? dateCreate);

  int? get authorId;
  set authorId(int? authorId);

  int? get postId;
  set postId(int? postId);

  String? get postText;
  set postText(String? postText);

  String? get userName;
  set userName(String? userName);

  String? get userLastName;
  set userLastName(String? userLastName);

  int? get likes;
  set likes(int? likes);

  bool? get likedByUser;
  set likedByUser(bool? likedByUser);

  String? get avatar;
  set avatar(String? avatar);

  bool? get allowEdit;
  set allowEdit(bool? allowEdit);

  bool? get allowDelete;
  set allowDelete(bool? allowDelete);
}

class _$$Comment extends $Comment {
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

  factory _$$Comment([void Function($CommentBuilder)? updates]) =>
      (new $CommentBuilder()..update(updates))._build();

  _$$Comment._(
      {required this.id,
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
    BuiltValueNullFieldError.checkNotNull(id, r'$Comment', 'id');
    BuiltValueNullFieldError.checkNotNull(
        dateCreate, r'$Comment', 'dateCreate');
    BuiltValueNullFieldError.checkNotNull(authorId, r'$Comment', 'authorId');
    BuiltValueNullFieldError.checkNotNull(postId, r'$Comment', 'postId');
    BuiltValueNullFieldError.checkNotNull(postText, r'$Comment', 'postText');
  }

  @override
  $Comment rebuild(void Function($CommentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $CommentBuilder toBuilder() => new $CommentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $Comment &&
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
    return (newBuiltValueToStringHelper(r'$Comment')
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

class $CommentBuilder
    implements Builder<$Comment, $CommentBuilder>, CommentBuilder {
  _$$Comment? _$v;

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

  $CommentBuilder() {
    $Comment._defaults(this);
  }

  $CommentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
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
  void replace(covariant $Comment other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$$Comment;
  }

  @override
  void update(void Function($CommentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $Comment build() => _build();

  _$$Comment _build() {
    final _$result = _$v ??
        new _$$Comment._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'$Comment', 'id'),
            dateCreate: BuiltValueNullFieldError.checkNotNull(
                dateCreate, r'$Comment', 'dateCreate'),
            authorId: BuiltValueNullFieldError.checkNotNull(
                authorId, r'$Comment', 'authorId'),
            postId: BuiltValueNullFieldError.checkNotNull(
                postId, r'$Comment', 'postId'),
            postText: BuiltValueNullFieldError.checkNotNull(
                postText, r'$Comment', 'postText'),
            userName: userName,
            userLastName: userLastName,
            likes: likes,
            likedByUser: likedByUser,
            avatar: avatar,
            allowEdit: allowEdit,
            allowDelete: allowDelete);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
