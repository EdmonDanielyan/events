// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_property.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EventsProperty extends EventsProperty {
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
  final String? previewPicture;

  factory _$EventsProperty([void Function(EventsPropertyBuilder)? updates]) =>
      (new EventsPropertyBuilder()..update(updates))._build();

  _$EventsProperty._(
      {required this.id,
      required this.title,
      this.dateCreate,
      this.dateStart,
      this.dateFinish,
      this.place,
      this.viewCount,
      this.previewPicture})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'EventsProperty', 'id');
    BuiltValueNullFieldError.checkNotNull(title, r'EventsProperty', 'title');
  }

  @override
  EventsProperty rebuild(void Function(EventsPropertyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventsPropertyBuilder toBuilder() =>
      new EventsPropertyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventsProperty &&
        id == other.id &&
        title == other.title &&
        dateCreate == other.dateCreate &&
        dateStart == other.dateStart &&
        dateFinish == other.dateFinish &&
        place == other.place &&
        viewCount == other.viewCount &&
        previewPicture == other.previewPicture;
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
    _$hash = $jc(_$hash, previewPicture.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventsProperty')
          ..add('id', id)
          ..add('title', title)
          ..add('dateCreate', dateCreate)
          ..add('dateStart', dateStart)
          ..add('dateFinish', dateFinish)
          ..add('place', place)
          ..add('viewCount', viewCount)
          ..add('previewPicture', previewPicture))
        .toString();
  }
}

class EventsPropertyBuilder
    implements Builder<EventsProperty, EventsPropertyBuilder> {
  _$EventsProperty? _$v;

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

  String? _previewPicture;
  String? get previewPicture => _$this._previewPicture;
  set previewPicture(String? previewPicture) =>
      _$this._previewPicture = previewPicture;

  EventsPropertyBuilder() {
    EventsProperty._defaults(this);
  }

  EventsPropertyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _dateCreate = $v.dateCreate;
      _dateStart = $v.dateStart;
      _dateFinish = $v.dateFinish;
      _place = $v.place;
      _viewCount = $v.viewCount;
      _previewPicture = $v.previewPicture;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventsProperty other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EventsProperty;
  }

  @override
  void update(void Function(EventsPropertyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventsProperty build() => _build();

  _$EventsProperty _build() {
    final _$result = _$v ??
        new _$EventsProperty._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'EventsProperty', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'EventsProperty', 'title'),
            dateCreate: dateCreate,
            dateStart: dateStart,
            dateFinish: dateFinish,
            place: place,
            viewCount: viewCount,
            previewPicture: previewPicture);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
