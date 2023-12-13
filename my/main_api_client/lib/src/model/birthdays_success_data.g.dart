// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'birthdays_success_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BirthdaysSuccessData extends BirthdaysSuccessData {
  @override
  final BuiltList<UserProperties>? others;
  @override
  final BuiltList<UserProperties>? today;

  factory _$BirthdaysSuccessData(
          [void Function(BirthdaysSuccessDataBuilder)? updates]) =>
      (new BirthdaysSuccessDataBuilder()..update(updates))._build();

  _$BirthdaysSuccessData._({this.others, this.today}) : super._();

  @override
  BirthdaysSuccessData rebuild(
          void Function(BirthdaysSuccessDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BirthdaysSuccessDataBuilder toBuilder() =>
      new BirthdaysSuccessDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BirthdaysSuccessData &&
        others == other.others &&
        today == other.today;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, others.hashCode);
    _$hash = $jc(_$hash, today.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BirthdaysSuccessData')
          ..add('others', others)
          ..add('today', today))
        .toString();
  }
}

class BirthdaysSuccessDataBuilder
    implements Builder<BirthdaysSuccessData, BirthdaysSuccessDataBuilder> {
  _$BirthdaysSuccessData? _$v;

  ListBuilder<UserProperties>? _others;
  ListBuilder<UserProperties> get others =>
      _$this._others ??= new ListBuilder<UserProperties>();
  set others(ListBuilder<UserProperties>? others) => _$this._others = others;

  ListBuilder<UserProperties>? _today;
  ListBuilder<UserProperties> get today =>
      _$this._today ??= new ListBuilder<UserProperties>();
  set today(ListBuilder<UserProperties>? today) => _$this._today = today;

  BirthdaysSuccessDataBuilder() {
    BirthdaysSuccessData._defaults(this);
  }

  BirthdaysSuccessDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _others = $v.others?.toBuilder();
      _today = $v.today?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BirthdaysSuccessData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BirthdaysSuccessData;
  }

  @override
  void update(void Function(BirthdaysSuccessDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BirthdaysSuccessData build() => _build();

  _$BirthdaysSuccessData _build() {
    _$BirthdaysSuccessData _$result;
    try {
      _$result = _$v ??
          new _$BirthdaysSuccessData._(
              others: _others?.build(), today: _today?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'others';
        _others?.build();
        _$failedField = 'today';
        _today?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'BirthdaysSuccessData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
