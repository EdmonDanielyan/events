// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_property.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EventProperty extends EventProperty {
  @override
  final int id;
  @override
  final String title;
  @override
  final DateTime? dateCreate;
  @override
  final DateTime? dateStart;
  @override
  final DateTime? dateFinish;
  @override
  final String? place;
  @override
  final int? viewCount;
  @override
  final String? detailText;
  @override
  final String? detailPicture;
  @override
  final bool? isMember;

  factory _$EventProperty([void Function(EventPropertyBuilder)? updates]) =>
      (new EventPropertyBuilder()..update(updates))._build();

  _$EventProperty._(
      {required this.id,
      required this.title,
      this.dateCreate,
      this.dateStart,
      this.dateFinish,
      this.place,
      this.viewCount,
      this.detailText,
      this.detailPicture,
      this.isMember})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'EventProperty', 'id');
    BuiltValueNullFieldError.checkNotNull(title, r'EventProperty', 'title');
  }

  @override
  EventProperty rebuild(void Function(EventPropertyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventPropertyBuilder toBuilder() => new EventPropertyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventProperty &&
        id == other.id &&
        title == other.title &&
        dateCreate == other.dateCreate &&
        dateStart == other.dateStart &&
        dateFinish == other.dateFinish &&
        place == other.place &&
        viewCount == other.viewCount &&
        detailText == other.detailText &&
        detailPicture == other.detailPicture &&
        isMember == other.isMember;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, dateCreate.hashCode);
    _$hash = $jc(_$hash, dateStart.hashCode);
    _$hash = $jc(_$hash, dateFinish.hashCode);
    _$hash = $jc(_$hash, place.hashCode);
    _$hash = $jc(_$hash, viewCount.hashCode);
    _$hash = $jc(_$hash, detailText.hashCode);
    _$hash = $jc(_$hash, detailPicture.hashCode);
    _$hash = $jc(_$hash, isMember.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventProperty')
          ..add('id', id)
          ..add('title', title)
          ..add('dateCreate', dateCreate)
          ..add('dateStart', dateStart)
          ..add('dateFinish', dateFinish)
          ..add('place', place)
          ..add('viewCount', viewCount)
          ..add('detailText', detailText)
          ..add('detailPicture', detailPicture)
          ..add('isMember', isMember))
        .toString();
  }
}

class EventPropertyBuilder
    implements Builder<EventProperty, EventPropertyBuilder> {
  _$EventProperty? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  DateTime? _dateCreate;
  DateTime? get dateCreate => _$this._dateCreate;
  set dateCreate(DateTime? dateCreate) => _$this._dateCreate = dateCreate;

  DateTime? _dateStart;
  DateTime? get dateStart => _$this._dateStart;
  set dateStart(DateTime? dateStart) => _$this._dateStart = dateStart;

  DateTime? _dateFinish;
  DateTime? get dateFinish => _$this._dateFinish;
  set dateFinish(DateTime? dateFinish) => _$this._dateFinish = dateFinish;

  String? _place;
  String? get place => _$this._place;
  set place(String? place) => _$this._place = place;

  int? _viewCount;
  int? get viewCount => _$this._viewCount;
  set viewCount(int? viewCount) => _$this._viewCount = viewCount;

  String? _detailText;
  String? get detailText => _$this._detailText;
  set detailText(String? detailText) => _$this._detailText = detailText;

  String? _detailPicture;
  String? get detailPicture => _$this._detailPicture;
  set detailPicture(String? detailPicture) =>
      _$this._detailPicture = detailPicture;

  bool? _isMember;
  bool? get isMember => _$this._isMember;
  set isMember(bool? isMember) => _$this._isMember = isMember;

  EventPropertyBuilder() {
    EventProperty._defaults(this);
  }

  EventPropertyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _dateCreate = $v.dateCreate;
      _dateStart = $v.dateStart;
      _dateFinish = $v.dateFinish;
      _place = $v.place;
      _viewCount = $v.viewCount;
      _detailText = $v.detailText;
      _detailPicture = $v.detailPicture;
      _isMember = $v.isMember;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventProperty other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EventProperty;
  }

  @override
  void update(void Function(EventPropertyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventProperty build() => _build();

  _$EventProperty _build() {
    final _$result = _$v ??
        new _$EventProperty._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'EventProperty', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'EventProperty', 'title'),
            dateCreate: dateCreate,
            dateStart: dateStart,
            dateFinish: dateFinish,
            place: place,
            viewCount: viewCount,
            detailText: detailText,
            detailPicture: detailPicture,
            isMember: isMember);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
