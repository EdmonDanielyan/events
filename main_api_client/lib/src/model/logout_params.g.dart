// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_params.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LogoutParams extends LogoutParams {
  @override
  final String token;

  factory _$LogoutParams([void Function(LogoutParamsBuilder)? updates]) =>
      (new LogoutParamsBuilder()..update(updates))._build();

  _$LogoutParams._({required this.token}) : super._() {
    BuiltValueNullFieldError.checkNotNull(token, r'LogoutParams', 'token');
  }

  @override
  LogoutParams rebuild(void Function(LogoutParamsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogoutParamsBuilder toBuilder() => new LogoutParamsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogoutParams && token == other.token;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LogoutParams')..add('token', token))
        .toString();
  }
}

class LogoutParamsBuilder
    implements Builder<LogoutParams, LogoutParamsBuilder> {
  _$LogoutParams? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  LogoutParamsBuilder() {
    LogoutParams._defaults(this);
  }

  LogoutParamsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LogoutParams other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LogoutParams;
  }

  @override
  void update(void Function(LogoutParamsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LogoutParams build() => _build();

  _$LogoutParams _build() {
    final _$result = _$v ??
        new _$LogoutParams._(
            token: BuiltValueNullFieldError.checkNotNull(
                token, r'LogoutParams', 'token'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
