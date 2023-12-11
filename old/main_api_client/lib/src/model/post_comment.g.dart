// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comment.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PostComment extends PostComment {
  @override
  final int newsId;
  @override
  final int parentId;
  @override
  final String text;

  factory _$PostComment([void Function(PostCommentBuilder)? updates]) =>
      (new PostCommentBuilder()..update(updates))._build();

  _$PostComment._(
      {required this.newsId, required this.parentId, required this.text})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(newsId, r'PostComment', 'newsId');
    BuiltValueNullFieldError.checkNotNull(parentId, r'PostComment', 'parentId');
    BuiltValueNullFieldError.checkNotNull(text, r'PostComment', 'text');
  }

  @override
  PostComment rebuild(void Function(PostCommentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostCommentBuilder toBuilder() => new PostCommentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostComment &&
        newsId == other.newsId &&
        parentId == other.parentId &&
        text == other.text;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, newsId.hashCode);
    _$hash = $jc(_$hash, parentId.hashCode);
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostComment')
          ..add('newsId', newsId)
          ..add('parentId', parentId)
          ..add('text', text))
        .toString();
  }
}

class PostCommentBuilder implements Builder<PostComment, PostCommentBuilder> {
  _$PostComment? _$v;

  int? _newsId;
  int? get newsId => _$this._newsId;
  set newsId(int? newsId) => _$this._newsId = newsId;

  int? _parentId;
  int? get parentId => _$this._parentId;
  set parentId(int? parentId) => _$this._parentId = parentId;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  PostCommentBuilder() {
    PostComment._defaults(this);
  }

  PostCommentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _newsId = $v.newsId;
      _parentId = $v.parentId;
      _text = $v.text;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostComment other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostComment;
  }

  @override
  void update(void Function(PostCommentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostComment build() => _build();

  _$PostComment _build() {
    final _$result = _$v ??
        new _$PostComment._(
            newsId: BuiltValueNullFieldError.checkNotNull(
                newsId, r'PostComment', 'newsId'),
            parentId: BuiltValueNullFieldError.checkNotNull(
                parentId, r'PostComment', 'parentId'),
            text: BuiltValueNullFieldError.checkNotNull(
                text, r'PostComment', 'text'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
