// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publications_property.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PublicationsProperty extends PublicationsProperty {
  @override
  final int? id;
  @override
  final String? title;
  @override
  final DateTime? dateCreate;
  @override
  final int? votes;

  factory _$PublicationsProperty(
          [void Function(PublicationsPropertyBuilder)? updates]) =>
      (new PublicationsPropertyBuilder()..update(updates))._build();

  _$PublicationsProperty._({this.id, this.title, this.dateCreate, this.votes})
      : super._();

  @override
  PublicationsProperty rebuild(
          void Function(PublicationsPropertyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PublicationsPropertyBuilder toBuilder() =>
      new PublicationsPropertyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PublicationsProperty &&
        id == other.id &&
        title == other.title &&
        dateCreate == other.dateCreate &&
        votes == other.votes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, dateCreate.hashCode);
    _$hash = $jc(_$hash, votes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PublicationsProperty')
          ..add('id', id)
          ..add('title', title)
          ..add('dateCreate', dateCreate)
          ..add('votes', votes))
        .toString();
  }
}

class PublicationsPropertyBuilder
    implements Builder<PublicationsProperty, PublicationsPropertyBuilder> {
  _$PublicationsProperty? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  DateTime? _dateCreate;
  DateTime? get dateCreate => _$this._dateCreate;
  set dateCreate(DateTime? dateCreate) => _$this._dateCreate = dateCreate;

  int? _votes;
  int? get votes => _$this._votes;
  set votes(int? votes) => _$this._votes = votes;

  PublicationsPropertyBuilder() {
    PublicationsProperty._defaults(this);
  }

  PublicationsPropertyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _dateCreate = $v.dateCreate;
      _votes = $v.votes;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PublicationsProperty other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PublicationsProperty;
  }

  @override
  void update(void Function(PublicationsPropertyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PublicationsProperty build() => _build();

  _$PublicationsProperty _build() {
    final _$result = _$v ??
        new _$PublicationsProperty._(
            id: id, title: title, dateCreate: dateCreate, votes: votes);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
