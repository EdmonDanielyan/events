// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_property.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NewsProperty extends NewsProperty {
  @override
  final int id;
  @override
  final String? title;
  @override
  final DateTime? dateCreate;
  @override
  final int? viewCount;
  @override
  final int? commentCount;
  @override
  final int? likeCount;
  @override
  final String? previewPicture;
  @override
  final bool? liked;

  factory _$NewsProperty([void Function(NewsPropertyBuilder)? updates]) =>
      (new NewsPropertyBuilder()..update(updates))._build();

  _$NewsProperty._(
      {required this.id,
      this.title,
      this.dateCreate,
      this.viewCount,
      this.commentCount,
      this.likeCount,
      this.previewPicture,
      this.liked})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'NewsProperty', 'id');
  }

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
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, dateCreate.hashCode);
    _$hash = $jc(_$hash, viewCount.hashCode);
    _$hash = $jc(_$hash, commentCount.hashCode);
    _$hash = $jc(_$hash, likeCount.hashCode);
    _$hash = $jc(_$hash, previewPicture.hashCode);
    _$hash = $jc(_$hash, liked.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NewsProperty')
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
  _$NewsProperty? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  DateTime? _dateCreate;
  DateTime? get dateCreate => _$this._dateCreate;
  set dateCreate(DateTime? dateCreate) => _$this._dateCreate = dateCreate;

  int? _viewCount;
  int? get viewCount => _$this._viewCount;
  set viewCount(int? viewCount) => _$this._viewCount = viewCount;

  int? _commentCount;
  int? get commentCount => _$this._commentCount;
  set commentCount(int? commentCount) => _$this._commentCount = commentCount;

  int? _likeCount;
  int? get likeCount => _$this._likeCount;
  set likeCount(int? likeCount) => _$this._likeCount = likeCount;

  String? _previewPicture;
  String? get previewPicture => _$this._previewPicture;
  set previewPicture(String? previewPicture) =>
      _$this._previewPicture = previewPicture;

  bool? _liked;
  bool? get liked => _$this._liked;
  set liked(bool? liked) => _$this._liked = liked;

  NewsPropertyBuilder() {
    NewsProperty._defaults(this);
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
  void update(void Function(NewsPropertyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NewsProperty build() => _build();

  _$NewsProperty _build() {
    final _$result = _$v ??
        new _$NewsProperty._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'NewsProperty', 'id'),
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

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
