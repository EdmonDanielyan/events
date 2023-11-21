// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_settings_response_body.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GlobalSettingsResponseBody extends GlobalSettingsResponseBody {
  @override
  final GlobalSettings? data;
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

  factory _$GlobalSettingsResponseBody(
          [void Function(GlobalSettingsResponseBodyBuilder)? updates]) =>
      (new GlobalSettingsResponseBodyBuilder()..update(updates))._build();

  _$GlobalSettingsResponseBody._(
      {this.data,
      required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'GlobalSettingsResponseBody', 'success');
    BuiltValueNullFieldError.checkNotNull(
        host, r'GlobalSettingsResponseBody', 'host');
    BuiltValueNullFieldError.checkNotNull(
        version, r'GlobalSettingsResponseBody', 'version');
    BuiltValueNullFieldError.checkNotNull(
        returned, r'GlobalSettingsResponseBody', 'returned');
    BuiltValueNullFieldError.checkNotNull(
        status, r'GlobalSettingsResponseBody', 'status');
  }

  @override
  GlobalSettingsResponseBody rebuild(
          void Function(GlobalSettingsResponseBodyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GlobalSettingsResponseBodyBuilder toBuilder() =>
      new GlobalSettingsResponseBodyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GlobalSettingsResponseBody &&
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
    return (newBuiltValueToStringHelper(r'GlobalSettingsResponseBody')
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status))
        .toString();
  }
}

class GlobalSettingsResponseBodyBuilder
    implements
        Builder<GlobalSettingsResponseBody, GlobalSettingsResponseBodyBuilder>,
        GlobalSettingsResponseBodyAllOfBuilder,
        RequiredSuccessBuilder {
  _$GlobalSettingsResponseBody? _$v;

  GlobalSettingsBuilder? _data;
  GlobalSettingsBuilder get data =>
      _$this._data ??= new GlobalSettingsBuilder();
  set data(covariant GlobalSettingsBuilder? data) => _$this._data = data;

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

  GlobalSettingsResponseBodyBuilder() {
    GlobalSettingsResponseBody._defaults(this);
  }

  GlobalSettingsResponseBodyBuilder get _$this {
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
// ignore: override_on_non_overriding_method
  void replace(covariant GlobalSettingsResponseBody other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GlobalSettingsResponseBody;
  }

  @override
  void update(void Function(GlobalSettingsResponseBodyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GlobalSettingsResponseBody build() => _build();

  _$GlobalSettingsResponseBody _build() {
    _$GlobalSettingsResponseBody _$result;
    try {
      _$result = _$v ??
          new _$GlobalSettingsResponseBody._(
              data: _data?.build(),
              success: BuiltValueNullFieldError.checkNotNull(
                  success, r'GlobalSettingsResponseBody', 'success'),
              host: BuiltValueNullFieldError.checkNotNull(
                  host, r'GlobalSettingsResponseBody', 'host'),
              version: BuiltValueNullFieldError.checkNotNull(
                  version, r'GlobalSettingsResponseBody', 'version'),
              returned: BuiltValueNullFieldError.checkNotNull(
                  returned, r'GlobalSettingsResponseBody', 'returned'),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'GlobalSettingsResponseBody', 'status'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GlobalSettingsResponseBody', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
