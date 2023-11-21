// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_property.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AnnouncementProperty extends AnnouncementProperty {
  @override
  final int id;
  @override
  final String title;
  @override
  final DateTime? dateCreate;
  @override
  final int? viewCount;
  @override
  final String? detailText;

  factory _$AnnouncementProperty(
          [void Function(AnnouncementPropertyBuilder)? updates]) =>
      (new AnnouncementPropertyBuilder()..update(updates))._build();

  _$AnnouncementProperty._(
      {required this.id,
      required this.title,
      this.dateCreate,
      this.viewCount,
      this.detailText})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'AnnouncementProperty', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'AnnouncementProperty', 'title');
  }

  @override
  AnnouncementProperty rebuild(
          void Function(AnnouncementPropertyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnnouncementPropertyBuilder toBuilder() =>
      new AnnouncementPropertyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnnouncementProperty &&
        id == other.id &&
        title == other.title &&
        dateCreate == other.dateCreate &&
        viewCount == other.viewCount &&
        detailText == other.detailText;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, dateCreate.hashCode);
    _$hash = $jc(_$hash, viewCount.hashCode);
    _$hash = $jc(_$hash, detailText.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnnouncementProperty')
          ..add('id', id)
          ..add('title', title)
          ..add('dateCreate', dateCreate)
          ..add('viewCount', viewCount)
          ..add('detailText', detailText))
        .toString();
  }
}

class AnnouncementPropertyBuilder
    implements Builder<AnnouncementProperty, AnnouncementPropertyBuilder> {
  _$AnnouncementProperty? _$v;

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

  String? _detailText;
  String? get detailText => _$this._detailText;
  set detailText(String? detailText) => _$this._detailText = detailText;

  AnnouncementPropertyBuilder() {
    AnnouncementProperty._defaults(this);
  }

  AnnouncementPropertyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _dateCreate = $v.dateCreate;
      _viewCount = $v.viewCount;
      _detailText = $v.detailText;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnnouncementProperty other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AnnouncementProperty;
  }

  @override
  void update(void Function(AnnouncementPropertyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnnouncementProperty build() => _build();

  _$AnnouncementProperty _build() {
    final _$result = _$v ??
        new _$AnnouncementProperty._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AnnouncementProperty', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'AnnouncementProperty', 'title'),
            dateCreate: dateCreate,
            viewCount: viewCount,
            detailText: detailText);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
