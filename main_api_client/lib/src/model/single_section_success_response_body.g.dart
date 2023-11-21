// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_section_success_response_body.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SingleSectionSuccessResponseBody
    extends SingleSectionSuccessResponseBody {
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
  final SingleSectionResponseData? data;

  factory _$SingleSectionSuccessResponseBody(
          [void Function(SingleSectionSuccessResponseBodyBuilder)? updates]) =>
      (new SingleSectionSuccessResponseBodyBuilder()..update(updates))._build();

  _$SingleSectionSuccessResponseBody._(
      {required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.status,
      this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'SingleSectionSuccessResponseBody', 'success');
    BuiltValueNullFieldError.checkNotNull(
        host, r'SingleSectionSuccessResponseBody', 'host');
    BuiltValueNullFieldError.checkNotNull(
        version, r'SingleSectionSuccessResponseBody', 'version');
    BuiltValueNullFieldError.checkNotNull(
        returned, r'SingleSectionSuccessResponseBody', 'returned');
    BuiltValueNullFieldError.checkNotNull(
        status, r'SingleSectionSuccessResponseBody', 'status');
  }

  @override
  SingleSectionSuccessResponseBody rebuild(
          void Function(SingleSectionSuccessResponseBodyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SingleSectionSuccessResponseBodyBuilder toBuilder() =>
      new SingleSectionSuccessResponseBodyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SingleSectionSuccessResponseBody &&
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
    return (newBuiltValueToStringHelper(r'SingleSectionSuccessResponseBody')
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status)
          ..add('data', data))
        .toString();
  }
}

class SingleSectionSuccessResponseBodyBuilder
    implements
        Builder<SingleSectionSuccessResponseBody,
            SingleSectionSuccessResponseBodyBuilder>,
        RequiredSuccessBuilder,
        SingleSectionSuccessResponseBodyAllOfBuilder {
  _$SingleSectionSuccessResponseBody? _$v;

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

  SingleSectionResponseDataBuilder? _data;
  SingleSectionResponseDataBuilder get data =>
      _$this._data ??= new SingleSectionResponseDataBuilder();
  set data(covariant SingleSectionResponseDataBuilder? data) =>
      _$this._data = data;

  SingleSectionSuccessResponseBodyBuilder() {
    SingleSectionSuccessResponseBody._defaults(this);
  }

  SingleSectionSuccessResponseBodyBuilder get _$this {
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
  void replace(covariant SingleSectionSuccessResponseBody other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SingleSectionSuccessResponseBody;
  }

  @override
  void update(void Function(SingleSectionSuccessResponseBodyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SingleSectionSuccessResponseBody build() => _build();

  _$SingleSectionSuccessResponseBody _build() {
    _$SingleSectionSuccessResponseBody _$result;
    try {
      _$result = _$v ??
          new _$SingleSectionSuccessResponseBody._(
              success: BuiltValueNullFieldError.checkNotNull(
                  success, r'SingleSectionSuccessResponseBody', 'success'),
              host: BuiltValueNullFieldError.checkNotNull(
                  host, r'SingleSectionSuccessResponseBody', 'host'),
              version: BuiltValueNullFieldError.checkNotNull(
                  version, r'SingleSectionSuccessResponseBody', 'version'),
              returned: BuiltValueNullFieldError.checkNotNull(
                  returned, r'SingleSectionSuccessResponseBody', 'returned'),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'SingleSectionSuccessResponseBody', 'status'),
              data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SingleSectionSuccessResponseBody', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
