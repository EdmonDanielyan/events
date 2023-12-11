// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uni_events_get_detail_resp_body.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UniEventsGetDetailRespBody extends UniEventsGetDetailRespBody {
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
  @override
  final UniEventsGetDetailRespBodyAllOfData data;

  factory _$UniEventsGetDetailRespBody(
          [void Function(UniEventsGetDetailRespBodyBuilder)? updates]) =>
      (new UniEventsGetDetailRespBodyBuilder()..update(updates))._build();

  _$UniEventsGetDetailRespBody._(
      {required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.status,
      required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'UniEventsGetDetailRespBody', 'success');
    BuiltValueNullFieldError.checkNotNull(
        host, r'UniEventsGetDetailRespBody', 'host');
    BuiltValueNullFieldError.checkNotNull(
        version, r'UniEventsGetDetailRespBody', 'version');
    BuiltValueNullFieldError.checkNotNull(
        returned, r'UniEventsGetDetailRespBody', 'returned');
    BuiltValueNullFieldError.checkNotNull(
        status, r'UniEventsGetDetailRespBody', 'status');
    BuiltValueNullFieldError.checkNotNull(
        data, r'UniEventsGetDetailRespBody', 'data');
  }

  @override
  UniEventsGetDetailRespBody rebuild(
          void Function(UniEventsGetDetailRespBodyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UniEventsGetDetailRespBodyBuilder toBuilder() =>
      new UniEventsGetDetailRespBodyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UniEventsGetDetailRespBody &&
        success == other.success &&
        host == other.host &&
        version == other.version &&
        returned == other.returned &&
        status == other.status &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, host.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, returned.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UniEventsGetDetailRespBody')
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status)
          ..add('data', data))
        .toString();
  }
}

class UniEventsGetDetailRespBodyBuilder
    implements
        Builder<UniEventsGetDetailRespBody, UniEventsGetDetailRespBodyBuilder>,
        RequiredSuccessBuilder,
        UniEventsGetDetailRespBodyAllOfBuilder {
  _$UniEventsGetDetailRespBody? _$v;

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

  UniEventsGetDetailRespBodyAllOfDataBuilder? _data;
  UniEventsGetDetailRespBodyAllOfDataBuilder get data =>
      _$this._data ??= new UniEventsGetDetailRespBodyAllOfDataBuilder();
  set data(covariant UniEventsGetDetailRespBodyAllOfDataBuilder? data) =>
      _$this._data = data;

  UniEventsGetDetailRespBodyBuilder() {
    UniEventsGetDetailRespBody._defaults(this);
  }

  UniEventsGetDetailRespBodyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _host = $v.host;
      _version = $v.version;
      _returned = $v.returned;
      _status = $v.status;
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
// ignore: override_on_non_overriding_method
  void replace(covariant UniEventsGetDetailRespBody other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UniEventsGetDetailRespBody;
  }

  @override
  void update(void Function(UniEventsGetDetailRespBodyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UniEventsGetDetailRespBody build() => _build();

  _$UniEventsGetDetailRespBody _build() {
    _$UniEventsGetDetailRespBody _$result;
    try {
      _$result = _$v ??
          new _$UniEventsGetDetailRespBody._(
              success: BuiltValueNullFieldError.checkNotNull(
                  success, r'UniEventsGetDetailRespBody', 'success'),
              host: BuiltValueNullFieldError.checkNotNull(
                  host, r'UniEventsGetDetailRespBody', 'host'),
              version: BuiltValueNullFieldError.checkNotNull(
                  version, r'UniEventsGetDetailRespBody', 'version'),
              returned: BuiltValueNullFieldError.checkNotNull(
                  returned, r'UniEventsGetDetailRespBody', 'returned'),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'UniEventsGetDetailRespBody', 'status'),
              data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UniEventsGetDetailRespBody', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
