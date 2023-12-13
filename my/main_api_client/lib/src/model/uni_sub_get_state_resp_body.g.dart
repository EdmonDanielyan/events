// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uni_sub_get_state_resp_body.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UniSubGetStateRespBody extends UniSubGetStateRespBody {
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
  final SubscriptionState data;

  factory _$UniSubGetStateRespBody(
          [void Function(UniSubGetStateRespBodyBuilder)? updates]) =>
      (new UniSubGetStateRespBodyBuilder()..update(updates))._build();

  _$UniSubGetStateRespBody._(
      {required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.status,
      required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'UniSubGetStateRespBody', 'success');
    BuiltValueNullFieldError.checkNotNull(
        host, r'UniSubGetStateRespBody', 'host');
    BuiltValueNullFieldError.checkNotNull(
        version, r'UniSubGetStateRespBody', 'version');
    BuiltValueNullFieldError.checkNotNull(
        returned, r'UniSubGetStateRespBody', 'returned');
    BuiltValueNullFieldError.checkNotNull(
        status, r'UniSubGetStateRespBody', 'status');
    BuiltValueNullFieldError.checkNotNull(
        data, r'UniSubGetStateRespBody', 'data');
  }

  @override
  UniSubGetStateRespBody rebuild(
          void Function(UniSubGetStateRespBodyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UniSubGetStateRespBodyBuilder toBuilder() =>
      new UniSubGetStateRespBodyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UniSubGetStateRespBody &&
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
    return (newBuiltValueToStringHelper(r'UniSubGetStateRespBody')
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status)
          ..add('data', data))
        .toString();
  }
}

class UniSubGetStateRespBodyBuilder
    implements
        Builder<UniSubGetStateRespBody, UniSubGetStateRespBodyBuilder>,
        RequiredSuccessBuilder,
        UniSubGetStateRespBodyAllOfBuilder {
  _$UniSubGetStateRespBody? _$v;

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

  SubscriptionStateBuilder? _data;
  SubscriptionStateBuilder get data =>
      _$this._data ??= new SubscriptionStateBuilder();
  set data(covariant SubscriptionStateBuilder? data) => _$this._data = data;

  UniSubGetStateRespBodyBuilder() {
    UniSubGetStateRespBody._defaults(this);
  }

  UniSubGetStateRespBodyBuilder get _$this {
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
  void replace(covariant UniSubGetStateRespBody other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UniSubGetStateRespBody;
  }

  @override
  void update(void Function(UniSubGetStateRespBodyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UniSubGetStateRespBody build() => _build();

  _$UniSubGetStateRespBody _build() {
    _$UniSubGetStateRespBody _$result;
    try {
      _$result = _$v ??
          new _$UniSubGetStateRespBody._(
              success: BuiltValueNullFieldError.checkNotNull(
                  success, r'UniSubGetStateRespBody', 'success'),
              host: BuiltValueNullFieldError.checkNotNull(
                  host, r'UniSubGetStateRespBody', 'host'),
              version: BuiltValueNullFieldError.checkNotNull(
                  version, r'UniSubGetStateRespBody', 'version'),
              returned: BuiltValueNullFieldError.checkNotNull(
                  returned, r'UniSubGetStateRespBody', 'returned'),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'UniSubGetStateRespBody', 'status'),
              data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UniSubGetStateRespBody', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
