// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uni_sub_request_field.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UniSubRequestField extends UniSubRequestField {
  @override
  final String? code;
  @override
  final String? value;

  factory _$UniSubRequestField(
          [void Function(UniSubRequestFieldBuilder)? updates]) =>
      (new UniSubRequestFieldBuilder()..update(updates))._build();

  _$UniSubRequestField._({this.code, this.value}) : super._();

  @override
  UniSubRequestField rebuild(
          void Function(UniSubRequestFieldBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UniSubRequestFieldBuilder toBuilder() =>
      new UniSubRequestFieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UniSubRequestField &&
        code == other.code &&
        value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UniSubRequestField')
          ..add('code', code)
          ..add('value', value))
        .toString();
  }
}

class UniSubRequestFieldBuilder
    implements Builder<UniSubRequestField, UniSubRequestFieldBuilder> {
  _$UniSubRequestField? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  UniSubRequestFieldBuilder() {
    UniSubRequestField._defaults(this);
  }

  UniSubRequestFieldBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UniSubRequestField other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UniSubRequestField;
  }

  @override
  void update(void Function(UniSubRequestFieldBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UniSubRequestField build() => _build();

  _$UniSubRequestField _build() {
    final _$result =
        _$v ?? new _$UniSubRequestField._(code: code, value: value);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
