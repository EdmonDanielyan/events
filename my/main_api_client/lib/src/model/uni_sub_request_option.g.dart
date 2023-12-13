// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uni_sub_request_option.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UniSubRequestOption extends UniSubRequestOption {
  @override
  final String id;
  @override
  final int value;

  factory _$UniSubRequestOption(
          [void Function(UniSubRequestOptionBuilder)? updates]) =>
      (new UniSubRequestOptionBuilder()..update(updates))._build();

  _$UniSubRequestOption._({required this.id, required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'UniSubRequestOption', 'id');
    BuiltValueNullFieldError.checkNotNull(
        value, r'UniSubRequestOption', 'value');
  }

  @override
  UniSubRequestOption rebuild(
          void Function(UniSubRequestOptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UniSubRequestOptionBuilder toBuilder() =>
      new UniSubRequestOptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UniSubRequestOption &&
        id == other.id &&
        value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UniSubRequestOption')
          ..add('id', id)
          ..add('value', value))
        .toString();
  }
}

class UniSubRequestOptionBuilder
    implements Builder<UniSubRequestOption, UniSubRequestOptionBuilder> {
  _$UniSubRequestOption? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _value;
  int? get value => _$this._value;
  set value(int? value) => _$this._value = value;

  UniSubRequestOptionBuilder() {
    UniSubRequestOption._defaults(this);
  }

  UniSubRequestOptionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UniSubRequestOption other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UniSubRequestOption;
  }

  @override
  void update(void Function(UniSubRequestOptionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UniSubRequestOption build() => _build();

  _$UniSubRequestOption _build() {
    final _$result = _$v ??
        new _$UniSubRequestOption._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'UniSubRequestOption', 'id'),
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'UniSubRequestOption', 'value'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
