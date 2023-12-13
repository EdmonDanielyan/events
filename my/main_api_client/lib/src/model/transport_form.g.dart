// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport_form.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TransportForm extends TransportForm {
  @override
  final int? ID;
  @override
  final String? title;

  factory _$TransportForm([void Function(TransportFormBuilder)? updates]) =>
      (new TransportFormBuilder()..update(updates))._build();

  _$TransportForm._({this.ID, this.title}) : super._();

  @override
  TransportForm rebuild(void Function(TransportFormBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransportFormBuilder toBuilder() => new TransportFormBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransportForm && ID == other.ID && title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ID.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TransportForm')
          ..add('ID', ID)
          ..add('title', title))
        .toString();
  }
}

class TransportFormBuilder
    implements Builder<TransportForm, TransportFormBuilder> {
  _$TransportForm? _$v;

  int? _ID;
  int? get ID => _$this._ID;
  set ID(int? ID) => _$this._ID = ID;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  TransportFormBuilder() {
    TransportForm._defaults(this);
  }

  TransportFormBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ID = $v.ID;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransportForm other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransportForm;
  }

  @override
  void update(void Function(TransportFormBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TransportForm build() => _build();

  _$TransportForm _build() {
    final _$result = _$v ?? new _$TransportForm._(ID: ID, title: title);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
