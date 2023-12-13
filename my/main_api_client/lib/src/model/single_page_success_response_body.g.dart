// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_page_success_response_body.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SinglePageSuccessResponseBody extends SinglePageSuccessResponseBody {
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
  final SinglePageResponseData? data;

  factory _$SinglePageSuccessResponseBody(
          [void Function(SinglePageSuccessResponseBodyBuilder)? updates]) =>
      (new SinglePageSuccessResponseBodyBuilder()..update(updates))._build();

  _$SinglePageSuccessResponseBody._(
      {required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.status,
      this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'SinglePageSuccessResponseBody', 'success');
    BuiltValueNullFieldError.checkNotNull(
        host, r'SinglePageSuccessResponseBody', 'host');
    BuiltValueNullFieldError.checkNotNull(
        version, r'SinglePageSuccessResponseBody', 'version');
    BuiltValueNullFieldError.checkNotNull(
        returned, r'SinglePageSuccessResponseBody', 'returned');
    BuiltValueNullFieldError.checkNotNull(
        status, r'SinglePageSuccessResponseBody', 'status');
  }

  @override
  SinglePageSuccessResponseBody rebuild(
          void Function(SinglePageSuccessResponseBodyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SinglePageSuccessResponseBodyBuilder toBuilder() =>
      new SinglePageSuccessResponseBodyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SinglePageSuccessResponseBody &&
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
    return (newBuiltValueToStringHelper(r'SinglePageSuccessResponseBody')
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status)
          ..add('data', data))
        .toString();
  }
}

class SinglePageSuccessResponseBodyBuilder
    implements
        Builder<SinglePageSuccessResponseBody,
            SinglePageSuccessResponseBodyBuilder>,
        RequiredSuccessBuilder,
        SinglePageSuccessResponseBodyAllOfBuilder {
  _$SinglePageSuccessResponseBody? _$v;

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

  SinglePageResponseDataBuilder? _data;
  SinglePageResponseDataBuilder get data =>
      _$this._data ??= new SinglePageResponseDataBuilder();
  set data(covariant SinglePageResponseDataBuilder? data) =>
      _$this._data = data;

  SinglePageSuccessResponseBodyBuilder() {
    SinglePageSuccessResponseBody._defaults(this);
  }

  SinglePageSuccessResponseBodyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _host = $v.host;
      _version = $v.version;
      _returned = $v.returned;
      _status = $v.status;
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
// ignore: override_on_non_overriding_method
  void replace(covariant SinglePageSuccessResponseBody other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SinglePageSuccessResponseBody;
  }

  @override
  void update(void Function(SinglePageSuccessResponseBodyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SinglePageSuccessResponseBody build() => _build();

  _$SinglePageSuccessResponseBody _build() {
    _$SinglePageSuccessResponseBody _$result;
    try {
      _$result = _$v ??
          new _$SinglePageSuccessResponseBody._(
              success: BuiltValueNullFieldError.checkNotNull(
                  success, r'SinglePageSuccessResponseBody', 'success'),
              host: BuiltValueNullFieldError.checkNotNull(
                  host, r'SinglePageSuccessResponseBody', 'host'),
              version: BuiltValueNullFieldError.checkNotNull(
                  version, r'SinglePageSuccessResponseBody', 'version'),
              returned: BuiltValueNullFieldError.checkNotNull(
                  returned, r'SinglePageSuccessResponseBody', 'returned'),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'SinglePageSuccessResponseBody', 'status'),
              data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SinglePageSuccessResponseBody', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
