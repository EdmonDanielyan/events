// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'auth_params.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthParams> _$authParamsSerializer = new _$AuthParamsSerializer();

class _$AuthParamsSerializer implements StructuredSerializer<AuthParams> {
  @override
  final Iterable<Type> types = const [AuthParams, _$AuthParams];
  @override
  final String wireName = 'AuthParams';

  @override
  Iterable<Object> serialize(Serializers serializers, AuthParams object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.login;
    if (value != null) {
      result
        ..add('login')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.password;
    if (value != null) {
      result
        ..add('password')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AuthParams deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthParamsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AuthParams extends AuthParams {
  @override
  final String login;
  @override
  final String password;

  factory _$AuthParams([void Function(AuthParamsBuilder) updates]) =>
      (new AuthParamsBuilder()..update(updates))._build();

  _$AuthParams._({this.login, this.password}) : super._();

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
  _$AuthParams _$v;

  String _login;
  String get login => _$this._login;
  set login(String login) => _$this._login = login;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  AuthParamsBuilder() {
    AuthParams._initializeBuilder(this);
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
  void update(void Function(AuthParamsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthParams build() => _build();

  _$AuthParams _build() {
    final _$result =
        _$v ?? new _$AuthParams._(login: login, password: password);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
