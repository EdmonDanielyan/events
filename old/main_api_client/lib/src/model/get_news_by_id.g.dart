// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_news_by_id.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetNewsById extends GetNewsById {
  @override
  final NewsPropertyById data;
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

  factory _$GetNewsById([void Function(GetNewsByIdBuilder)? updates]) =>
      (new GetNewsByIdBuilder()..update(updates))._build();

  _$GetNewsById._(
      {required this.data,
      required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'GetNewsById', 'data');
    BuiltValueNullFieldError.checkNotNull(success, r'GetNewsById', 'success');
    BuiltValueNullFieldError.checkNotNull(host, r'GetNewsById', 'host');
    BuiltValueNullFieldError.checkNotNull(version, r'GetNewsById', 'version');
    BuiltValueNullFieldError.checkNotNull(returned, r'GetNewsById', 'returned');
    BuiltValueNullFieldError.checkNotNull(status, r'GetNewsById', 'status');
  }

  @override
  GetNewsById rebuild(void Function(GetNewsByIdBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetNewsByIdBuilder toBuilder() => new GetNewsByIdBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetNewsById &&
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
    return (newBuiltValueToStringHelper(r'GetNewsById')
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status))
        .toString();
  }
}

class GetNewsByIdBuilder
    implements
        Builder<GetNewsById, GetNewsByIdBuilder>,
        RequiredSuccessBuilder {
  _$GetNewsById? _$v;

  NewsPropertyByIdBuilder? _data;
  NewsPropertyByIdBuilder get data =>
      _$this._data ??= new NewsPropertyByIdBuilder();
  set data(covariant NewsPropertyByIdBuilder? data) => _$this._data = data;

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

  GetNewsByIdBuilder() {
    GetNewsById._defaults(this);
  }

  GetNewsByIdBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
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
  void replace(covariant GetNewsById other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetNewsById;
  }

  @override
  void update(void Function(GetNewsByIdBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetNewsById build() => _build();

  _$GetNewsById _build() {
    _$GetNewsById _$result;
    try {
      _$result = _$v ??
          new _$GetNewsById._(
              data: data.build(),
              success: BuiltValueNullFieldError.checkNotNull(
                  success, r'GetNewsById', 'success'),
              host: BuiltValueNullFieldError.checkNotNull(
                  host, r'GetNewsById', 'host'),
              version: BuiltValueNullFieldError.checkNotNull(
                  version, r'GetNewsById', 'version'),
              returned: BuiltValueNullFieldError.checkNotNull(
                  returned, r'GetNewsById', 'returned'),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'GetNewsById', 'status'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetNewsById', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
