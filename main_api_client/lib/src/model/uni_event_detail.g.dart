// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uni_event_detail.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UniEventDetail extends UniEventDetail {
  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? place;
  @override
  final String? viewCount;
  @override
  final BuiltList<Date>? dates;
  @override
  final DateTime? dateStart;
  @override
  final DateTime? dateFinish;
  @override
  final String? previewPicture;
  @override
  final String? detailText;
  @override
  final String? detailPicture;
  @override
  final String? subId;

  factory _$UniEventDetail([void Function(UniEventDetailBuilder)? updates]) =>
      (new UniEventDetailBuilder()..update(updates))._build();

  _$UniEventDetail._(
      {this.id,
      this.title,
      this.place,
      this.viewCount,
      this.dates,
      this.dateStart,
      this.dateFinish,
      this.previewPicture,
      this.detailText,
      this.detailPicture,
      this.subId})
      : super._();

  @override
  UniEventDetail rebuild(void Function(UniEventDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UniEventDetailBuilder toBuilder() =>
      new UniEventDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UniEventDetail &&
        id == other.id &&
        title == other.title &&
        place == other.place &&
        viewCount == other.viewCount &&
        dates == other.dates &&
        dateStart == other.dateStart &&
        dateFinish == other.dateFinish &&
        previewPicture == other.previewPicture &&
        detailText == other.detailText &&
        detailPicture == other.detailPicture &&
        subId == other.subId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, place.hashCode);
    _$hash = $jc(_$hash, viewCount.hashCode);
    _$hash = $jc(_$hash, dates.hashCode);
    _$hash = $jc(_$hash, dateStart.hashCode);
    _$hash = $jc(_$hash, dateFinish.hashCode);
    _$hash = $jc(_$hash, previewPicture.hashCode);
    _$hash = $jc(_$hash, detailText.hashCode);
    _$hash = $jc(_$hash, detailPicture.hashCode);
    _$hash = $jc(_$hash, subId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UniEventDetail')
          ..add('id', id)
          ..add('title', title)
          ..add('place', place)
          ..add('viewCount', viewCount)
          ..add('dates', dates)
          ..add('dateStart', dateStart)
          ..add('dateFinish', dateFinish)
          ..add('previewPicture', previewPicture)
          ..add('detailText', detailText)
          ..add('detailPicture', detailPicture)
          ..add('subId', subId))
        .toString();
  }
}

class UniEventDetailBuilder
    implements Builder<UniEventDetail, UniEventDetailBuilder> {
  _$UniEventDetail? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _place;
  String? get place => _$this._place;
  set place(String? place) => _$this._place = place;

  String? _viewCount;
  String? get viewCount => _$this._viewCount;
  set viewCount(String? viewCount) => _$this._viewCount = viewCount;

  ListBuilder<Date>? _dates;
  ListBuilder<Date> get dates => _$this._dates ??= new ListBuilder<Date>();
  set dates(ListBuilder<Date>? dates) => _$this._dates = dates;

  DateTime? _dateStart;
  DateTime? get dateStart => _$this._dateStart;
  set dateStart(DateTime? dateStart) => _$this._dateStart = dateStart;

  DateTime? _dateFinish;
  DateTime? get dateFinish => _$this._dateFinish;
  set dateFinish(DateTime? dateFinish) => _$this._dateFinish = dateFinish;

  String? _previewPicture;
  String? get previewPicture => _$this._previewPicture;
  set previewPicture(String? previewPicture) =>
      _$this._previewPicture = previewPicture;

  String? _detailText;
  String? get detailText => _$this._detailText;
  set detailText(String? detailText) => _$this._detailText = detailText;

  String? _detailPicture;
  String? get detailPicture => _$this._detailPicture;
  set detailPicture(String? detailPicture) =>
      _$this._detailPicture = detailPicture;

  String? _subId;
  String? get subId => _$this._subId;
  set subId(String? subId) => _$this._subId = subId;

  UniEventDetailBuilder() {
    UniEventDetail._defaults(this);
  }

  UniEventDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _place = $v.place;
      _viewCount = $v.viewCount;
      _dates = $v.dates?.toBuilder();
      _dateStart = $v.dateStart;
      _dateFinish = $v.dateFinish;
      _previewPicture = $v.previewPicture;
      _detailText = $v.detailText;
      _detailPicture = $v.detailPicture;
      _subId = $v.subId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UniEventDetail other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UniEventDetail;
  }

  @override
  void update(void Function(UniEventDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UniEventDetail build() => _build();

  _$UniEventDetail _build() {
    _$UniEventDetail _$result;
    try {
      _$result = _$v ??
          new _$UniEventDetail._(
              id: id,
              title: title,
              place: place,
              viewCount: viewCount,
              dates: _dates?.build(),
              dateStart: dateStart,
              dateFinish: dateFinish,
              previewPicture: previewPicture,
              detailText: detailText,
              detailPicture: detailPicture,
              subId: subId);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'dates';
        _dates?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UniEventDetail', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
