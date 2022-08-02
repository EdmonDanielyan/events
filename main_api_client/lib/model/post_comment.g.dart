// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'post_comment.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostComment> _$postCommentSerializer = new _$PostCommentSerializer();

class _$PostCommentSerializer implements StructuredSerializer<PostComment> {
  @override
  final Iterable<Type> types = const [PostComment, _$PostComment];
  @override
  final String wireName = 'PostComment';

  @override
  Iterable<Object> serialize(Serializers serializers, PostComment object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.newsId;
    if (value != null) {
      result
        ..add('news_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.parentId;
    if (value != null) {
      result
        ..add('parent_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.text;
    if (value != null) {
      result
        ..add('text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PostComment deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostCommentBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'news_id':
          result.newsId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'parent_id':
          result.parentId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PostComment extends PostComment {
  @override
  final int newsId;
  @override
  final int parentId;
  @override
  final String text;

  factory _$PostComment([void Function(PostCommentBuilder) updates]) =>
      (new PostCommentBuilder()..update(updates))._build();

  _$PostComment._({this.newsId, this.parentId, this.text}) : super._();

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
    return $jf(
        $jc($jc($jc(0, newsId.hashCode), parentId.hashCode), text.hashCode));
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
  _$PostComment _$v;

  int _newsId;
  int get newsId => _$this._newsId;
  set newsId(int newsId) => _$this._newsId = newsId;

  int _parentId;
  int get parentId => _$this._parentId;
  set parentId(int parentId) => _$this._parentId = parentId;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  PostCommentBuilder() {
    PostComment._initializeBuilder(this);
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
  void update(void Function(PostCommentBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  PostComment build() => _build();

  _$PostComment _build() {
    final _$result = _$v ??
        new _$PostComment._(newsId: newsId, parentId: parentId, text: text);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
