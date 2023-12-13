// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_property_by_id.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NewsPropertyById extends NewsPropertyById {
  @override
  final int id;
  @override
  final String? title;
  @override
  final DateTime? dateCreate;
  @override
  final int? commentCount;
  @override
  final int? viewCount;
  @override
  final int? likeCount;
  @override
  final String? detailText;
  @override
  final BuiltList<String?>? imageLinks;
  @override
  final BuiltList<String?>? videoLinks;
  @override
  final bool? liked;

  factory _$NewsPropertyById(
          [void Function(NewsPropertyByIdBuilder)? updates]) =>
      (new NewsPropertyByIdBuilder()..update(updates))._build();

  _$NewsPropertyById._(
      {required this.id,
      this.title,
      this.dateCreate,
      this.commentCount,
      this.viewCount,
      this.likeCount,
      this.detailText,
      this.imageLinks,
      this.videoLinks,
      this.liked})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'NewsPropertyById', 'id');
  }

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
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, dateCreate.hashCode);
    _$hash = $jc(_$hash, commentCount.hashCode);
    _$hash = $jc(_$hash, viewCount.hashCode);
    _$hash = $jc(_$hash, likeCount.hashCode);
    _$hash = $jc(_$hash, detailText.hashCode);
    _$hash = $jc(_$hash, imageLinks.hashCode);
    _$hash = $jc(_$hash, videoLinks.hashCode);
    _$hash = $jc(_$hash, liked.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
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
  _$NewsPropertyById? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  DateTime? _dateCreate;
  DateTime? get dateCreate => _$this._dateCreate;
  set dateCreate(DateTime? dateCreate) => _$this._dateCreate = dateCreate;

  int? _commentCount;
  int? get commentCount => _$this._commentCount;
  set commentCount(int? commentCount) => _$this._commentCount = commentCount;

  int? _viewCount;
  int? get viewCount => _$this._viewCount;
  set viewCount(int? viewCount) => _$this._viewCount = viewCount;

  int? _likeCount;
  int? get likeCount => _$this._likeCount;
  set likeCount(int? likeCount) => _$this._likeCount = likeCount;

  String? _detailText;
  String? get detailText => _$this._detailText;
  set detailText(String? detailText) => _$this._detailText = detailText;

  ListBuilder<String?>? _imageLinks;
  ListBuilder<String?> get imageLinks =>
      _$this._imageLinks ??= new ListBuilder<String?>();
  set imageLinks(ListBuilder<String?>? imageLinks) =>
      _$this._imageLinks = imageLinks;

  ListBuilder<String?>? _videoLinks;
  ListBuilder<String?> get videoLinks =>
      _$this._videoLinks ??= new ListBuilder<String?>();
  set videoLinks(ListBuilder<String?>? videoLinks) =>
      _$this._videoLinks = videoLinks;

  bool? _liked;
  bool? get liked => _$this._liked;
  set liked(bool? liked) => _$this._liked = liked;

  NewsPropertyByIdBuilder() {
    NewsPropertyById._defaults(this);
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
  void update(void Function(NewsPropertyByIdBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NewsPropertyById build() => _build();

  _$NewsPropertyById _build() {
    _$NewsPropertyById _$result;
    try {
      _$result = _$v ??
          new _$NewsPropertyById._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'NewsPropertyById', 'id'),
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
      late String _$failedField;
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

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
