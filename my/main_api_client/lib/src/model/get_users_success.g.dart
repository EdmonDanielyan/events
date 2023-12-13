// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users_success.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetUsersSuccess extends GetUsersSuccess {
  @override
  final BuiltList<JsonObject>? data;
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

  factory _$GetUsersSuccess([void Function(GetUsersSuccessBuilder)? updates]) =>
      (new GetUsersSuccessBuilder()..update(updates))._build();

  _$GetUsersSuccess._(
      {this.data,
      required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'GetUsersSuccess', 'success');
    BuiltValueNullFieldError.checkNotNull(host, r'GetUsersSuccess', 'host');
    BuiltValueNullFieldError.checkNotNull(
        version, r'GetUsersSuccess', 'version');
    BuiltValueNullFieldError.checkNotNull(
        returned, r'GetUsersSuccess', 'returned');
    BuiltValueNullFieldError.checkNotNull(status, r'GetUsersSuccess', 'status');
  }

  @override
  GetUsersSuccess rebuild(void Function(GetUsersSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetUsersSuccessBuilder toBuilder() =>
      new GetUsersSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetUsersSuccess &&
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
    return (newBuiltValueToStringHelper(r'GetUsersSuccess')
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status))
        .toString();
  }
}

class GetUsersSuccessBuilder
    implements
        Builder<GetUsersSuccess, GetUsersSuccessBuilder>,
        RequiredSuccessBuilder {
  _$GetUsersSuccess? _$v;

  ListBuilder<JsonObject>? _data;
  ListBuilder<JsonObject> get data =>
      _$this._data ??= new ListBuilder<JsonObject>();
  set data(covariant ListBuilder<JsonObject>? data) => _$this._data = data;

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

  GetUsersSuccessBuilder() {
    GetUsersSuccess._defaults(this);
  }

  GetUsersSuccessBuilder get _$this {
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
  void replace(covariant GetUsersSuccess other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetUsersSuccess;
  }

  @override
  void update(void Function(GetUsersSuccessBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetUsersSuccess build() => _build();

  _$GetUsersSuccess _build() {
    _$GetUsersSuccess _$result;
    try {
      _$result = _$v ??
          new _$GetUsersSuccess._(
              data: _data?.build(),
              success: BuiltValueNullFieldError.checkNotNull(
                  success, r'GetUsersSuccess', 'success'),
              host: BuiltValueNullFieldError.checkNotNull(
                  host, r'GetUsersSuccess', 'host'),
              version: BuiltValueNullFieldError.checkNotNull(
                  version, r'GetUsersSuccess', 'version'),
              returned: BuiltValueNullFieldError.checkNotNull(
                  returned, r'GetUsersSuccess', 'returned'),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'GetUsersSuccess', 'status'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetUsersSuccess', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
