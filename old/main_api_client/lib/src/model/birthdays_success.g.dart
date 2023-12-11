// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'birthdays_success.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BirthdaysSuccess extends BirthdaysSuccess {
  @override
  final BirthdaysSuccessData? data;
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

  factory _$BirthdaysSuccess(
          [void Function(BirthdaysSuccessBuilder)? updates]) =>
      (new BirthdaysSuccessBuilder()..update(updates))._build();

  _$BirthdaysSuccess._(
      {this.data,
      required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'BirthdaysSuccess', 'success');
    BuiltValueNullFieldError.checkNotNull(host, r'BirthdaysSuccess', 'host');
    BuiltValueNullFieldError.checkNotNull(
        version, r'BirthdaysSuccess', 'version');
    BuiltValueNullFieldError.checkNotNull(
        returned, r'BirthdaysSuccess', 'returned');
    BuiltValueNullFieldError.checkNotNull(
        status, r'BirthdaysSuccess', 'status');
  }

  @override
  BirthdaysSuccess rebuild(void Function(BirthdaysSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BirthdaysSuccessBuilder toBuilder() =>
      new BirthdaysSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BirthdaysSuccess &&
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
    return (newBuiltValueToStringHelper(r'BirthdaysSuccess')
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status))
        .toString();
  }
}

class BirthdaysSuccessBuilder
    implements
        Builder<BirthdaysSuccess, BirthdaysSuccessBuilder>,
        RequiredSuccessBuilder {
  _$BirthdaysSuccess? _$v;

  BirthdaysSuccessDataBuilder? _data;
  BirthdaysSuccessDataBuilder get data =>
      _$this._data ??= new BirthdaysSuccessDataBuilder();
  set data(covariant BirthdaysSuccessDataBuilder? data) => _$this._data = data;

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

  BirthdaysSuccessBuilder() {
    BirthdaysSuccess._defaults(this);
  }

  BirthdaysSuccessBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
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
  void replace(covariant BirthdaysSuccess other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BirthdaysSuccess;
  }

  @override
  void update(void Function(BirthdaysSuccessBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BirthdaysSuccess build() => _build();

  _$BirthdaysSuccess _build() {
    _$BirthdaysSuccess _$result;
    try {
      _$result = _$v ??
          new _$BirthdaysSuccess._(
              data: _data?.build(),
              success: BuiltValueNullFieldError.checkNotNull(
                  success, r'BirthdaysSuccess', 'success'),
              host: BuiltValueNullFieldError.checkNotNull(
                  host, r'BirthdaysSuccess', 'host'),
              version: BuiltValueNullFieldError.checkNotNull(
                  version, r'BirthdaysSuccess', 'version'),
              returned: BuiltValueNullFieldError.checkNotNull(
                  returned, r'BirthdaysSuccess', 'returned'),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'BirthdaysSuccess', 'status'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'BirthdaysSuccess', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
