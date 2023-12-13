// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_news.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetNews extends GetNews {
  @override
  final JsonObject data;
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

  factory _$GetNews([void Function(GetNewsBuilder)? updates]) =>
      (new GetNewsBuilder()..update(updates))._build();

  _$GetNews._(
      {required this.data,
      required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'GetNews', 'data');
    BuiltValueNullFieldError.checkNotNull(success, r'GetNews', 'success');
    BuiltValueNullFieldError.checkNotNull(host, r'GetNews', 'host');
    BuiltValueNullFieldError.checkNotNull(version, r'GetNews', 'version');
    BuiltValueNullFieldError.checkNotNull(returned, r'GetNews', 'returned');
    BuiltValueNullFieldError.checkNotNull(status, r'GetNews', 'status');
  }

  @override
  GetNews rebuild(void Function(GetNewsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetNewsBuilder toBuilder() => new GetNewsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetNews &&
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
    return (newBuiltValueToStringHelper(r'GetNews')
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status))
        .toString();
  }
}

class GetNewsBuilder
    implements Builder<GetNews, GetNewsBuilder>, RequiredSuccessBuilder {
  _$GetNews? _$v;

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

  GetNewsBuilder() {
    GetNews._defaults(this);
  }

  GetNewsBuilder get _$this {
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
  void replace(covariant GetNews other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetNews;
  }

  @override
  void update(void Function(GetNewsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetNews build() => _build();

  _$GetNews _build() {
    final _$result = _$v ??
        new _$GetNews._(
            data:
                BuiltValueNullFieldError.checkNotNull(data, r'GetNews', 'data'),
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'GetNews', 'success'),
            host:
                BuiltValueNullFieldError.checkNotNull(host, r'GetNews', 'host'),
            version: BuiltValueNullFieldError.checkNotNull(
                version, r'GetNews', 'version'),
            returned: BuiltValueNullFieldError.checkNotNull(
                returned, r'GetNews', 'returned'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'GetNews', 'status'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
