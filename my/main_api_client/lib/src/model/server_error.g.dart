// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_error.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ServerError extends ServerError {
  @override
  final String? code;
  @override
  final int? status;
  @override
  final bool success;
  @override
  final String host;
  @override
  final String version;
  @override
  final DateTime returned;
  @override
  final String type;
  @override
  final String instance;

  factory _$ServerError([void Function(ServerErrorBuilder)? updates]) =>
      (new ServerErrorBuilder()..update(updates))._build();

  _$ServerError._(
      {this.code,
      this.status,
      required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.type,
      required this.instance})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(success, r'ServerError', 'success');
    BuiltValueNullFieldError.checkNotNull(host, r'ServerError', 'host');
    BuiltValueNullFieldError.checkNotNull(version, r'ServerError', 'version');
    BuiltValueNullFieldError.checkNotNull(returned, r'ServerError', 'returned');
    BuiltValueNullFieldError.checkNotNull(type, r'ServerError', 'type');
    BuiltValueNullFieldError.checkNotNull(instance, r'ServerError', 'instance');
  }

  @override
  ServerError rebuild(void Function(ServerErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServerErrorBuilder toBuilder() => new ServerErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServerError &&
        code == other.code &&
        status == other.status &&
        success == other.success &&
        host == other.host &&
        version == other.version &&
        returned == other.returned &&
        type == other.type &&
        instance == other.instance;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, host.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, returned.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, instance.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServerError')
          ..add('code', code)
          ..add('status', status)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('type', type)
          ..add('instance', instance))
        .toString();
  }
}

class ServerErrorBuilder
    implements Builder<ServerError, ServerErrorBuilder>, RequiredErrorBuilder {
  _$ServerError? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(covariant String? code) => _$this._code = code;

  int? _status;
  int? get status => _$this._status;
  set status(covariant int? status) => _$this._status = status;

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

  String? _type;
  String? get type => _$this._type;
  set type(covariant String? type) => _$this._type = type;

  String? _instance;
  String? get instance => _$this._instance;
  set instance(covariant String? instance) => _$this._instance = instance;

  ServerErrorBuilder() {
    ServerError._defaults(this);
  }

  ServerErrorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _status = $v.status;
      _success = $v.success;
      _host = $v.host;
      _version = $v.version;
      _returned = $v.returned;
      _type = $v.type;
      _instance = $v.instance;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ServerError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServerError;
  }

  @override
  void update(void Function(ServerErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServerError build() => _build();

  _$ServerError _build() {
    final _$result = _$v ??
        new _$ServerError._(
            code: code,
            status: status,
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'ServerError', 'success'),
            host: BuiltValueNullFieldError.checkNotNull(
                host, r'ServerError', 'host'),
            version: BuiltValueNullFieldError.checkNotNull(
                version, r'ServerError', 'version'),
            returned: BuiltValueNullFieldError.checkNotNull(
                returned, r'ServerError', 'returned'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'ServerError', 'type'),
            instance: BuiltValueNullFieldError.checkNotNull(
                instance, r'ServerError', 'instance'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
