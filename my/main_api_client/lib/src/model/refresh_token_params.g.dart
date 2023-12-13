// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_params.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RefreshTokenParams extends RefreshTokenParams {
  @override
  final String token;

  factory _$RefreshTokenParams(
          [void Function(RefreshTokenParamsBuilder)? updates]) =>
      (new RefreshTokenParamsBuilder()..update(updates))._build();

  _$RefreshTokenParams._({required this.token}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        token, r'RefreshTokenParams', 'token');
  }

  @override
  RefreshTokenParams rebuild(
          void Function(RefreshTokenParamsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RefreshTokenParamsBuilder toBuilder() =>
      new RefreshTokenParamsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RefreshTokenParams && token == other.token;
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
    return (newBuiltValueToStringHelper(r'RefreshTokenParams')
          ..add('token', token))
        .toString();
  }
}

class RefreshTokenParamsBuilder
    implements Builder<RefreshTokenParams, RefreshTokenParamsBuilder> {
  _$RefreshTokenParams? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  RefreshTokenParamsBuilder() {
    RefreshTokenParams._defaults(this);
  }

  RefreshTokenParamsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RefreshTokenParams other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RefreshTokenParams;
  }

  @override
  void update(void Function(RefreshTokenParamsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RefreshTokenParams build() => _build();

  _$RefreshTokenParams _build() {
    final _$result = _$v ??
        new _$RefreshTokenParams._(
            token: BuiltValueNullFieldError.checkNotNull(
                token, r'RefreshTokenParams', 'token'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
