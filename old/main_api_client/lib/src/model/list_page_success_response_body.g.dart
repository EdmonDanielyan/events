// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_page_success_response_body.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ListPageSuccessResponseBody extends ListPageSuccessResponseBody {
  @override
  final ListPageResponseData? data;
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

  factory _$ListPageSuccessResponseBody(
          [void Function(ListPageSuccessResponseBodyBuilder)? updates]) =>
      (new ListPageSuccessResponseBodyBuilder()..update(updates))._build();

  _$ListPageSuccessResponseBody._(
      {this.data,
      required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'ListPageSuccessResponseBody', 'success');
    BuiltValueNullFieldError.checkNotNull(
        host, r'ListPageSuccessResponseBody', 'host');
    BuiltValueNullFieldError.checkNotNull(
        version, r'ListPageSuccessResponseBody', 'version');
    BuiltValueNullFieldError.checkNotNull(
        returned, r'ListPageSuccessResponseBody', 'returned');
    BuiltValueNullFieldError.checkNotNull(
        status, r'ListPageSuccessResponseBody', 'status');
  }

  @override
  ListPageSuccessResponseBody rebuild(
          void Function(ListPageSuccessResponseBodyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListPageSuccessResponseBodyBuilder toBuilder() =>
      new ListPageSuccessResponseBodyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListPageSuccessResponseBody &&
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
    return (newBuiltValueToStringHelper(r'ListPageSuccessResponseBody')
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status))
        .toString();
  }
}

class ListPageSuccessResponseBodyBuilder
    implements
        Builder<ListPageSuccessResponseBody,
            ListPageSuccessResponseBodyBuilder>,
        ListPageSuccessResponseBodyAllOfBuilder,
        RequiredSuccessBuilder {
  _$ListPageSuccessResponseBody? _$v;

  ListPageResponseDataBuilder? _data;
  ListPageResponseDataBuilder get data =>
      _$this._data ??= new ListPageResponseDataBuilder();
  set data(covariant ListPageResponseDataBuilder? data) => _$this._data = data;

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

  ListPageSuccessResponseBodyBuilder() {
    ListPageSuccessResponseBody._defaults(this);
  }

  ListPageSuccessResponseBodyBuilder get _$this {
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
  void replace(covariant ListPageSuccessResponseBody other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ListPageSuccessResponseBody;
  }

  @override
  void update(void Function(ListPageSuccessResponseBodyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ListPageSuccessResponseBody build() => _build();

  _$ListPageSuccessResponseBody _build() {
    _$ListPageSuccessResponseBody _$result;
    try {
      _$result = _$v ??
          new _$ListPageSuccessResponseBody._(
              data: _data?.build(),
              success: BuiltValueNullFieldError.checkNotNull(
                  success, r'ListPageSuccessResponseBody', 'success'),
              host: BuiltValueNullFieldError.checkNotNull(
                  host, r'ListPageSuccessResponseBody', 'host'),
              version: BuiltValueNullFieldError.checkNotNull(
                  version, r'ListPageSuccessResponseBody', 'version'),
              returned: BuiltValueNullFieldError.checkNotNull(
                  returned, r'ListPageSuccessResponseBody', 'returned'),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'ListPageSuccessResponseBody', 'status'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ListPageSuccessResponseBody', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
