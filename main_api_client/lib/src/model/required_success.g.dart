// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'required_success.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class RequiredSuccessBuilder {
  void replace(RequiredSuccess other);
  void update(void Function(RequiredSuccessBuilder) updates);
  bool? get success;
  set success(bool? success);

  String? get host;
  set host(String? host);

  String? get version;
  set version(String? version);

  DateTime? get returned;
  set returned(DateTime? returned);

  int? get status;
  set status(int? status);
}

class _$$RequiredSuccess extends $RequiredSuccess {
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

  factory _$$RequiredSuccess(
          [void Function($RequiredSuccessBuilder)? updates]) =>
      (new $RequiredSuccessBuilder()..update(updates))._build();

  _$$RequiredSuccess._(
      {required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'$RequiredSuccess', 'success');
    BuiltValueNullFieldError.checkNotNull(host, r'$RequiredSuccess', 'host');
    BuiltValueNullFieldError.checkNotNull(
        version, r'$RequiredSuccess', 'version');
    BuiltValueNullFieldError.checkNotNull(
        returned, r'$RequiredSuccess', 'returned');
    BuiltValueNullFieldError.checkNotNull(
        status, r'$RequiredSuccess', 'status');
  }

  @override
  $RequiredSuccess rebuild(void Function($RequiredSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $RequiredSuccessBuilder toBuilder() =>
      new $RequiredSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $RequiredSuccess &&
        success == other.success &&
        host == other.host &&
        version == other.version &&
        returned == other.returned &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
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
    return (newBuiltValueToStringHelper(r'$RequiredSuccess')
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status))
        .toString();
  }
}

class $RequiredSuccessBuilder
    implements
        Builder<$RequiredSuccess, $RequiredSuccessBuilder>,
        RequiredSuccessBuilder {
  _$$RequiredSuccess? _$v;

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

  $RequiredSuccessBuilder() {
    $RequiredSuccess._defaults(this);
  }

  $RequiredSuccessBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
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
  void replace(covariant $RequiredSuccess other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$$RequiredSuccess;
  }

  @override
  void update(void Function($RequiredSuccessBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $RequiredSuccess build() => _build();

  _$$RequiredSuccess _build() {
    final _$result = _$v ??
        new _$$RequiredSuccess._(
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'$RequiredSuccess', 'success'),
            host: BuiltValueNullFieldError.checkNotNull(
                host, r'$RequiredSuccess', 'host'),
            version: BuiltValueNullFieldError.checkNotNull(
                version, r'$RequiredSuccess', 'version'),
            returned: BuiltValueNullFieldError.checkNotNull(
                returned, r'$RequiredSuccess', 'returned'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'$RequiredSuccess', 'status'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
