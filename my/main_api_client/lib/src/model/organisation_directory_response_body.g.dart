// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organisation_directory_response_body.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OrganisationDirectoryResponseBody
    extends OrganisationDirectoryResponseBody {
  @override
  final OrganisationDirectory? data;
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

  factory _$OrganisationDirectoryResponseBody(
          [void Function(OrganisationDirectoryResponseBodyBuilder)? updates]) =>
      (new OrganisationDirectoryResponseBodyBuilder()..update(updates))
          ._build();

  _$OrganisationDirectoryResponseBody._(
      {this.data,
      required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'OrganisationDirectoryResponseBody', 'success');
    BuiltValueNullFieldError.checkNotNull(
        host, r'OrganisationDirectoryResponseBody', 'host');
    BuiltValueNullFieldError.checkNotNull(
        version, r'OrganisationDirectoryResponseBody', 'version');
    BuiltValueNullFieldError.checkNotNull(
        returned, r'OrganisationDirectoryResponseBody', 'returned');
    BuiltValueNullFieldError.checkNotNull(
        status, r'OrganisationDirectoryResponseBody', 'status');
  }

  @override
  OrganisationDirectoryResponseBody rebuild(
          void Function(OrganisationDirectoryResponseBodyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrganisationDirectoryResponseBodyBuilder toBuilder() =>
      new OrganisationDirectoryResponseBodyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrganisationDirectoryResponseBody &&
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
    return (newBuiltValueToStringHelper(r'OrganisationDirectoryResponseBody')
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status))
        .toString();
  }
}

class OrganisationDirectoryResponseBodyBuilder
    implements
        Builder<OrganisationDirectoryResponseBody,
            OrganisationDirectoryResponseBodyBuilder>,
        OrganisationDirectoryResponseBodyAllOfBuilder,
        RequiredSuccessBuilder {
  _$OrganisationDirectoryResponseBody? _$v;

  OrganisationDirectoryBuilder? _data;
  OrganisationDirectoryBuilder get data =>
      _$this._data ??= new OrganisationDirectoryBuilder();
  set data(covariant OrganisationDirectoryBuilder? data) => _$this._data = data;

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

  OrganisationDirectoryResponseBodyBuilder() {
    OrganisationDirectoryResponseBody._defaults(this);
  }

  OrganisationDirectoryResponseBodyBuilder get _$this {
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
  void replace(covariant OrganisationDirectoryResponseBody other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrganisationDirectoryResponseBody;
  }

  @override
  void update(
      void Function(OrganisationDirectoryResponseBodyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrganisationDirectoryResponseBody build() => _build();

  _$OrganisationDirectoryResponseBody _build() {
    _$OrganisationDirectoryResponseBody _$result;
    try {
      _$result = _$v ??
          new _$OrganisationDirectoryResponseBody._(
              data: _data?.build(),
              success: BuiltValueNullFieldError.checkNotNull(
                  success, r'OrganisationDirectoryResponseBody', 'success'),
              host: BuiltValueNullFieldError.checkNotNull(
                  host, r'OrganisationDirectoryResponseBody', 'host'),
              version: BuiltValueNullFieldError.checkNotNull(
                  version, r'OrganisationDirectoryResponseBody', 'version'),
              returned: BuiltValueNullFieldError.checkNotNull(
                  returned, r'OrganisationDirectoryResponseBody', 'returned'),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'OrganisationDirectoryResponseBody', 'status'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OrganisationDirectoryResponseBody', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
