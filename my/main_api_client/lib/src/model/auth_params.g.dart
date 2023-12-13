// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_params.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthParams extends AuthParams {
  @override
  final String login;
  @override
  final String password;

  factory _$AuthParams([void Function(AuthParamsBuilder)? updates]) =>
      (new AuthParamsBuilder()..update(updates))._build();

  _$AuthParams._({required this.login, required this.password}) : super._() {
    BuiltValueNullFieldError.checkNotNull(login, r'AuthParams', 'login');
    BuiltValueNullFieldError.checkNotNull(password, r'AuthParams', 'password');
  }

  @override
  AuthParams rebuild(void Function(AuthParamsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthParamsBuilder toBuilder() => new AuthParamsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthParams &&
        login == other.login &&
        password == other.password;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthParams')
          ..add('login', login)
          ..add('password', password))
        .toString();
  }
}

class AuthParamsBuilder implements Builder<AuthParams, AuthParamsBuilder> {
  _$AuthParams? _$v;

  String? _login;
  String? get login => _$this._login;
  set login(String? login) => _$this._login = login;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  AuthParamsBuilder() {
    AuthParams._defaults(this);
  }

  AuthParamsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _login = $v.login;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthParams other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthParams;
  }

  @override
  void update(void Function(AuthParamsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthParams build() => _build();

  _$AuthParams _build() {
    final _$result = _$v ??
        new _$AuthParams._(
            login: BuiltValueNullFieldError.checkNotNull(
                login, r'AuthParams', 'login'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, r'AuthParams', 'password'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
