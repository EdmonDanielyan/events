// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'news_property.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NewsProperty> _$newsPropertySerializer =
    new _$NewsPropertySerializer();

class _$NewsPropertySerializer implements StructuredSerializer<NewsProperty> {
  @override
  final Iterable<Type> types = const [NewsProperty, _$NewsProperty];
  @override
  final String wireName = 'NewsProperty';

  @override
  Iterable<Object> serialize(Serializers serializers, NewsProperty object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateCreate;
    if (value != null) {
      result
        ..add('date_create')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.viewCount;
    if (value != null) {
      result
        ..add('view_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.commentCount;
    if (value != null) {
      result
        ..add('comment_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.likeCount;
    if (value != null) {
      result
        ..add('like_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.previewPicture;
    if (value != null) {
      result
        ..add('preview_picture')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.liked;
    if (value != null) {
      result
        ..add('liked')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  NewsProperty deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NewsPropertyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date_create':
          result.dateCreate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'view_count':
          result.viewCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'comment_count':
          result.commentCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'like_count':
          result.likeCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'preview_picture':
          result.previewPicture = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'liked':
          result.liked = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$NewsProperty extends NewsProperty {
  @override
  final int id;
  @override
  final String title;
  @override
  final DateTime dateCreate;
  @override
  final int viewCount;
  @override
  final int commentCount;
  @override
  final int likeCount;
  @override
  final String previewPicture;
  @override
  final bool liked;

  factory _$NewsProperty([void Function(NewsPropertyBuilder) updates]) =>
      (new NewsPropertyBuilder()..update(updates)).build();

  _$NewsProperty._(
      {this.id,
      this.title,
      this.dateCreate,
      this.viewCount,
      this.commentCount,
      this.likeCount,
      this.previewPicture,
      this.liked})
      : super._();

  @override
  NewsProperty rebuild(void Function(NewsPropertyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewsPropertyBuilder toBuilder() => new NewsPropertyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsProperty &&
        id == other.id &&
        title == other.title &&
        dateCreate == other.dateCreate &&
        viewCount == other.viewCount &&
        commentCount == other.commentCount &&
        likeCount == other.likeCount &&
        previewPicture == other.previewPicture &&
        liked == other.liked;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, id.hashCode), title.hashCode),
                            dateCreate.hashCode),
                        viewCount.hashCode),
                    commentCount.hashCode),
                likeCount.hashCode),
            previewPicture.hashCode),
        liked.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NewsProperty')
          ..add('id', id)
          ..add('title', title)
          ..add('dateCreate', dateCreate)
          ..add('viewCount', viewCount)
          ..add('commentCount', commentCount)
          ..add('likeCount', likeCount)
          ..add('previewPicture', previewPicture)
          ..add('liked', liked))
        .toString();
  }
}

class NewsPropertyBuilder
    implements Builder<NewsProperty, NewsPropertyBuilder> {
  _$NewsProperty _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  DateTime _dateCreate;
  DateTime get dateCreate => _$this._dateCreate;
  set dateCreate(DateTime dateCreate) => _$this._dateCreate = dateCreate;

  int _viewCount;
  int get viewCount => _$this._viewCount;
  set viewCount(int viewCount) => _$this._viewCount = viewCount;

  int _commentCount;
  int get commentCount => _$this._commentCount;
  set commentCount(int commentCount) => _$this._commentCount = commentCount;

  int _likeCount;
  int get likeCount => _$this._likeCount;
  set likeCount(int likeCount) => _$this._likeCount = likeCount;

  String _previewPicture;
  String get previewPicture => _$this._previewPicture;
  set previewPicture(String previewPicture) =>
      _$this._previewPicture = previewPicture;

  bool _liked;
  bool get liked => _$this._liked;
  set liked(bool liked) => _$this._liked = liked;

  NewsPropertyBuilder() {
    NewsProperty._initializeBuilder(this);
  }

  NewsPropertyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _dateCreate = $v.dateCreate;
      _viewCount = $v.viewCount;
      _commentCount = $v.commentCount;
      _likeCount = $v.likeCount;
      _previewPicture = $v.previewPicture;
      _liked = $v.liked;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewsProperty other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NewsProperty;
  }

  @override
  void update(void Function(NewsPropertyBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NewsProperty build() {
    final _$result = _$v ??
        new _$NewsProperty._(
            id: id,
            title: title,
            dateCreate: dateCreate,
            viewCount: viewCount,
            commentCount: commentCount,
            likeCount: likeCount,
            previewPicture: previewPicture,
            liked: liked);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
