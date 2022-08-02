// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'news_property_by_id.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NewsPropertyById> _$newsPropertyByIdSerializer =
    new _$NewsPropertyByIdSerializer();

class _$NewsPropertyByIdSerializer
    implements StructuredSerializer<NewsPropertyById> {
  @override
  final Iterable<Type> types = const [NewsPropertyById, _$NewsPropertyById];
  @override
  final String wireName = 'NewsPropertyById';

  @override
  Iterable<Object> serialize(Serializers serializers, NewsPropertyById object,
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
    value = object.commentCount;
    if (value != null) {
      result
        ..add('comment_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.viewCount;
    if (value != null) {
      result
        ..add('view_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.likeCount;
    if (value != null) {
      result
        ..add('like_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.detailText;
    if (value != null) {
      result
        ..add('detail_text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imageLinks;
    if (value != null) {
      result
        ..add('image_links')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.videoLinks;
    if (value != null) {
      result
        ..add('video_links')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  NewsPropertyById deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NewsPropertyByIdBuilder();

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
        case 'comment_count':
          result.commentCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'view_count':
          result.viewCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'like_count':
          result.likeCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'detail_text':
          result.detailText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'image_links':
          result.imageLinks.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'video_links':
          result.videoLinks.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
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

class _$NewsPropertyById extends NewsPropertyById {
  @override
  final int id;
  @override
  final String title;
  @override
  final DateTime dateCreate;
  @override
  final int commentCount;
  @override
  final int viewCount;
  @override
  final int likeCount;
  @override
  final String detailText;
  @override
  final BuiltList<String> imageLinks;
  @override
  final BuiltList<String> videoLinks;
  @override
  final bool liked;

  factory _$NewsPropertyById(
          [void Function(NewsPropertyByIdBuilder) updates]) =>
      (new NewsPropertyByIdBuilder()..update(updates))._build();

  _$NewsPropertyById._(
      {this.id,
      this.title,
      this.dateCreate,
      this.commentCount,
      this.viewCount,
      this.likeCount,
      this.detailText,
      this.imageLinks,
      this.videoLinks,
      this.liked})
      : super._();

  @override
  NewsPropertyById rebuild(void Function(NewsPropertyByIdBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewsPropertyByIdBuilder toBuilder() =>
      new NewsPropertyByIdBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsPropertyById &&
        id == other.id &&
        title == other.title &&
        dateCreate == other.dateCreate &&
        commentCount == other.commentCount &&
        viewCount == other.viewCount &&
        likeCount == other.likeCount &&
        detailText == other.detailText &&
        imageLinks == other.imageLinks &&
        videoLinks == other.videoLinks &&
        liked == other.liked;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc($jc(0, id.hashCode), title.hashCode),
                                    dateCreate.hashCode),
                                commentCount.hashCode),
                            viewCount.hashCode),
                        likeCount.hashCode),
                    detailText.hashCode),
                imageLinks.hashCode),
            videoLinks.hashCode),
        liked.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NewsPropertyById')
          ..add('id', id)
          ..add('title', title)
          ..add('dateCreate', dateCreate)
          ..add('commentCount', commentCount)
          ..add('viewCount', viewCount)
          ..add('likeCount', likeCount)
          ..add('detailText', detailText)
          ..add('imageLinks', imageLinks)
          ..add('videoLinks', videoLinks)
          ..add('liked', liked))
        .toString();
  }
}

class NewsPropertyByIdBuilder
    implements Builder<NewsPropertyById, NewsPropertyByIdBuilder> {
  _$NewsPropertyById _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  DateTime _dateCreate;
  DateTime get dateCreate => _$this._dateCreate;
  set dateCreate(DateTime dateCreate) => _$this._dateCreate = dateCreate;

  int _commentCount;
  int get commentCount => _$this._commentCount;
  set commentCount(int commentCount) => _$this._commentCount = commentCount;

  int _viewCount;
  int get viewCount => _$this._viewCount;
  set viewCount(int viewCount) => _$this._viewCount = viewCount;

  int _likeCount;
  int get likeCount => _$this._likeCount;
  set likeCount(int likeCount) => _$this._likeCount = likeCount;

  String _detailText;
  String get detailText => _$this._detailText;
  set detailText(String detailText) => _$this._detailText = detailText;

  ListBuilder<String> _imageLinks;
  ListBuilder<String> get imageLinks =>
      _$this._imageLinks ??= new ListBuilder<String>();
  set imageLinks(ListBuilder<String> imageLinks) =>
      _$this._imageLinks = imageLinks;

  ListBuilder<String> _videoLinks;
  ListBuilder<String> get videoLinks =>
      _$this._videoLinks ??= new ListBuilder<String>();
  set videoLinks(ListBuilder<String> videoLinks) =>
      _$this._videoLinks = videoLinks;

  bool _liked;
  bool get liked => _$this._liked;
  set liked(bool liked) => _$this._liked = liked;

  NewsPropertyByIdBuilder() {
    NewsPropertyById._initializeBuilder(this);
  }

  NewsPropertyByIdBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _dateCreate = $v.dateCreate;
      _commentCount = $v.commentCount;
      _viewCount = $v.viewCount;
      _likeCount = $v.likeCount;
      _detailText = $v.detailText;
      _imageLinks = $v.imageLinks?.toBuilder();
      _videoLinks = $v.videoLinks?.toBuilder();
      _liked = $v.liked;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewsPropertyById other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NewsPropertyById;
  }

  @override
  void update(void Function(NewsPropertyByIdBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  NewsPropertyById build() => _build();

  _$NewsPropertyById _build() {
    _$NewsPropertyById _$result;
    try {
      _$result = _$v ??
          new _$NewsPropertyById._(
              id: id,
              title: title,
              dateCreate: dateCreate,
              commentCount: commentCount,
              viewCount: viewCount,
              likeCount: likeCount,
              detailText: detailText,
              imageLinks: _imageLinks?.build(),
              videoLinks: _videoLinks?.build(),
              liked: liked);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'imageLinks';
        _imageLinks?.build();
        _$failedField = 'videoLinks';
        _videoLinks?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'NewsPropertyById', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
