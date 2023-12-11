// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_success.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegisterSuccess extends RegisterSuccess {
  @override
  final JsonObject? data;
  @override
  final bool success;
  @override
  final String host;
  @override
  final String version;
  @override
  final DateTime returned;
  @override
  final int status;

  factory _$RegisterSuccess([void Function(RegisterSuccessBuilder)? updates]) =>
      (new RegisterSuccessBuilder()..update(updates))._build();

  _$RegisterSuccess._(
      {this.data,
      required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'RegisterSuccess', 'success');
    BuiltValueNullFieldError.checkNotNull(host, r'RegisterSuccess', 'host');
    BuiltValueNullFieldError.checkNotNull(
        version, r'RegisterSuccess', 'version');
    BuiltValueNullFieldError.checkNotNull(
        returned, r'RegisterSuccess', 'returned');
    BuiltValueNullFieldError.checkNotNull(status, r'RegisterSuccess', 'status');
  }

  @override
  RegisterSuccess rebuild(void Function(RegisterSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterSuccessBuilder toBuilder() =>
      new RegisterSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterSuccess &&
        data == other.data &&
        success == other.success &&
        host == other.host &&
        version == other.version &&
        returned == other.returned &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, host.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, returned.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterSuccess')
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status))
        .toString();
  }
}

class RegisterSuccessBuilder
    implements
        Builder<RegisterSuccess, RegisterSuccessBuilder>,
        RequiredSuccessBuilder {
  _$RegisterSuccess? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  bool? _success;
  bool? get success => _$this._success;
  set success(covariant bool? success) => _$this._success = success;

  String? _host;
  String? get host => _$this._host;
  set host(covariant String? host) => _$this._host = host;

  String? _version;
  String? get version => _$this._version;
  set version(covariant String? version) => _$this._version = version;

  DateTime? _returned;
  DateTime? get returned => _$this._returned;
  set returned(covariant DateTime? returned) => _$this._returned = returned;

  int? _status;
  int? get status => _$this._status;
  set status(covariant int? status) => _$this._status = status;

  RegisterSuccessBuilder() {
    RegisterSuccess._defaults(this);
  }

  RegisterSuccessBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _success = $v.success;
      _host = $v.host;
      _version = $v.version;
      _returned = $v.returned;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant RegisterSuccess other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterSuccess;
  }

  @override
  void update(void Function(RegisterSuccessBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterSuccess build() => _build();

  _$RegisterSuccess _build() {
    final _$result = _$v ??
        new _$RegisterSuccess._(
            data: data,
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'RegisterSuccess', 'success'),
            host: BuiltValueNullFieldError.checkNotNull(
                host, r'RegisterSuccess', 'host'),
            version: BuiltValueNullFieldError.checkNotNull(
                version, r'RegisterSuccess', 'version'),
            returned: BuiltValueNullFieldError.checkNotNull(
                returned, r'RegisterSuccess', 'returned'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'RegisterSuccess', 'status'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
