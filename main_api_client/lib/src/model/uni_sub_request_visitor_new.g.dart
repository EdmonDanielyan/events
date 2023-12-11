// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uni_sub_request_visitor_new.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UniSubRequestVisitorNew extends UniSubRequestVisitorNew {
  @override
  final String? name;
  @override
  final String? type;
  @override
  final Date? birthday;
  @override
  final String? option;

  factory _$UniSubRequestVisitorNew(
          [void Function(UniSubRequestVisitorNewBuilder)? updates]) =>
      (new UniSubRequestVisitorNewBuilder()..update(updates))._build();

  _$UniSubRequestVisitorNew._(
      {this.name, this.type, this.birthday, this.option})
      : super._();

  @override
  UniSubRequestVisitorNew rebuild(
          void Function(UniSubRequestVisitorNewBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UniSubRequestVisitorNewBuilder toBuilder() =>
      new UniSubRequestVisitorNewBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UniSubRequestVisitorNew &&
        name == other.name &&
        type == other.type &&
        birthday == other.birthday &&
        option == other.option;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, birthday.hashCode);
    _$hash = $jc(_$hash, option.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UniSubRequestVisitorNew')
          ..add('name', name)
          ..add('type', type)
          ..add('birthday', birthday)
          ..add('option', option))
        .toString();
  }
}

class UniSubRequestVisitorNewBuilder
    implements
        Builder<UniSubRequestVisitorNew, UniSubRequestVisitorNewBuilder> {
  _$UniSubRequestVisitorNew? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  Date? _birthday;
  Date? get birthday => _$this._birthday;
  set birthday(Date? birthday) => _$this._birthday = birthday;

  String? _option;
  String? get option => _$this._option;
  set option(String? option) => _$this._option = option;

  UniSubRequestVisitorNewBuilder() {
    UniSubRequestVisitorNew._defaults(this);
  }

  UniSubRequestVisitorNewBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _type = $v.type;
      _birthday = $v.birthday;
      _option = $v.option;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UniSubRequestVisitorNew other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UniSubRequestVisitorNew;
  }

  @override
  void update(void Function(UniSubRequestVisitorNewBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UniSubRequestVisitorNew build() => _build();

  _$UniSubRequestVisitorNew _build() {
    final _$result = _$v ??
        new _$UniSubRequestVisitorNew._(
            name: name, type: type, birthday: birthday, option: option);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
