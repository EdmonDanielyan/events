// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcements_property.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AnnouncementsProperty extends AnnouncementsProperty {
  @override
  final int id;
  @override
  final String title;
  @override
  final DateTime? dateCreate;
  @override
  final int? viewCount;

  factory _$AnnouncementsProperty(
          [void Function(AnnouncementsPropertyBuilder)? updates]) =>
      (new AnnouncementsPropertyBuilder()..update(updates))._build();

  _$AnnouncementsProperty._(
      {required this.id, required this.title, this.dateCreate, this.viewCount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'AnnouncementsProperty', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'AnnouncementsProperty', 'title');
  }

  @override
  AnnouncementsProperty rebuild(
          void Function(AnnouncementsPropertyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnnouncementsPropertyBuilder toBuilder() =>
      new AnnouncementsPropertyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnnouncementsProperty &&
        id == other.id &&
        title == other.title &&
        dateCreate == other.dateCreate &&
        viewCount == other.viewCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, dateCreate.hashCode);
    _$hash = $jc(_$hash, viewCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnnouncementsProperty')
          ..add('id', id)
          ..add('title', title)
          ..add('dateCreate', dateCreate)
          ..add('viewCount', viewCount))
        .toString();
  }
}

class AnnouncementsPropertyBuilder
    implements Builder<AnnouncementsProperty, AnnouncementsPropertyBuilder> {
  _$AnnouncementsProperty? _$v;

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

  AnnouncementsPropertyBuilder() {
    AnnouncementsProperty._defaults(this);
  }

  AnnouncementsPropertyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _dateCreate = $v.dateCreate;
      _viewCount = $v.viewCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnnouncementsProperty other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AnnouncementsProperty;
  }

  @override
  void update(void Function(AnnouncementsPropertyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnnouncementsProperty build() => _build();

  _$AnnouncementsProperty _build() {
    final _$result = _$v ??
        new _$AnnouncementsProperty._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AnnouncementsProperty', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'AnnouncementsProperty', 'title'),
            dateCreate: dateCreate,
            viewCount: viewCount);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
