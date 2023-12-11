// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uni_events_get_list_resp_body.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UniEventsGetListRespBody extends UniEventsGetListRespBody {
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
  final UniEventsGetListRespBodyAllOfData data;

  factory _$UniEventsGetListRespBody(
          [void Function(UniEventsGetListRespBodyBuilder)? updates]) =>
      (new UniEventsGetListRespBodyBuilder()..update(updates))._build();

  _$UniEventsGetListRespBody._(
      {required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.status,
      required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'UniEventsGetListRespBody', 'success');
    BuiltValueNullFieldError.checkNotNull(
        host, r'UniEventsGetListRespBody', 'host');
    BuiltValueNullFieldError.checkNotNull(
        version, r'UniEventsGetListRespBody', 'version');
    BuiltValueNullFieldError.checkNotNull(
        returned, r'UniEventsGetListRespBody', 'returned');
    BuiltValueNullFieldError.checkNotNull(
        status, r'UniEventsGetListRespBody', 'status');
    BuiltValueNullFieldError.checkNotNull(
        data, r'UniEventsGetListRespBody', 'data');
  }

  @override
  UniEventsGetListRespBody rebuild(
          void Function(UniEventsGetListRespBodyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UniEventsGetListRespBodyBuilder toBuilder() =>
      new UniEventsGetListRespBodyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UniEventsGetListRespBody &&
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
    return (newBuiltValueToStringHelper(r'UniEventsGetListRespBody')
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status)
          ..add('data', data))
        .toString();
  }
}

class UniEventsGetListRespBodyBuilder
    implements
        Builder<UniEventsGetListRespBody, UniEventsGetListRespBodyBuilder>,
        RequiredSuccessBuilder,
        UniEventsGetListRespBodyAllOfBuilder {
  _$UniEventsGetListRespBody? _$v;

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

  UniEventsGetListRespBodyAllOfDataBuilder? _data;
  UniEventsGetListRespBodyAllOfDataBuilder get data =>
      _$this._data ??= new UniEventsGetListRespBodyAllOfDataBuilder();
  set data(covariant UniEventsGetListRespBodyAllOfDataBuilder? data) =>
      _$this._data = data;

  UniEventsGetListRespBodyBuilder() {
    UniEventsGetListRespBody._defaults(this);
  }

  UniEventsGetListRespBodyBuilder get _$this {
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
  void replace(covariant UniEventsGetListRespBody other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UniEventsGetListRespBody;
  }

  @override
  void update(void Function(UniEventsGetListRespBodyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UniEventsGetListRespBody build() => _build();

  _$UniEventsGetListRespBody _build() {
    _$UniEventsGetListRespBody _$result;
    try {
      _$result = _$v ??
          new _$UniEventsGetListRespBody._(
              success: BuiltValueNullFieldError.checkNotNull(
                  success, r'UniEventsGetListRespBody', 'success'),
              host: BuiltValueNullFieldError.checkNotNull(
                  host, r'UniEventsGetListRespBody', 'host'),
              version: BuiltValueNullFieldError.checkNotNull(
                  version, r'UniEventsGetListRespBody', 'version'),
              returned: BuiltValueNullFieldError.checkNotNull(
                  returned, r'UniEventsGetListRespBody', 'returned'),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'UniEventsGetListRespBody', 'status'),
              data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UniEventsGetListRespBody', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
