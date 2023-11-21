// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_transport_order_form.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetTransportOrderForm extends GetTransportOrderForm {
  @override
  final BuiltList<TransportForm>? data;
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

  factory _$GetTransportOrderForm(
          [void Function(GetTransportOrderFormBuilder)? updates]) =>
      (new GetTransportOrderFormBuilder()..update(updates))._build();

  _$GetTransportOrderForm._(
      {this.data,
      required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'GetTransportOrderForm', 'success');
    BuiltValueNullFieldError.checkNotNull(
        host, r'GetTransportOrderForm', 'host');
    BuiltValueNullFieldError.checkNotNull(
        version, r'GetTransportOrderForm', 'version');
    BuiltValueNullFieldError.checkNotNull(
        returned, r'GetTransportOrderForm', 'returned');
    BuiltValueNullFieldError.checkNotNull(
        status, r'GetTransportOrderForm', 'status');
  }

  @override
  GetTransportOrderForm rebuild(
          void Function(GetTransportOrderFormBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetTransportOrderFormBuilder toBuilder() =>
      new GetTransportOrderFormBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetTransportOrderForm &&
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
    return (newBuiltValueToStringHelper(r'GetTransportOrderForm')
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status))
        .toString();
  }
}

class GetTransportOrderFormBuilder
    implements
        Builder<GetTransportOrderForm, GetTransportOrderFormBuilder>,
        RequiredSuccessBuilder {
  _$GetTransportOrderForm? _$v;

  ListBuilder<TransportForm>? _data;
  ListBuilder<TransportForm> get data =>
      _$this._data ??= new ListBuilder<TransportForm>();
  set data(covariant ListBuilder<TransportForm>? data) => _$this._data = data;

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

  GetTransportOrderFormBuilder() {
    GetTransportOrderForm._defaults(this);
  }

  GetTransportOrderFormBuilder get _$this {
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
  void replace(covariant GetTransportOrderForm other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetTransportOrderForm;
  }

  @override
  void update(void Function(GetTransportOrderFormBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetTransportOrderForm build() => _build();

  _$GetTransportOrderForm _build() {
    _$GetTransportOrderForm _$result;
    try {
      _$result = _$v ??
          new _$GetTransportOrderForm._(
              data: _data?.build(),
              success: BuiltValueNullFieldError.checkNotNull(
                  success, r'GetTransportOrderForm', 'success'),
              host: BuiltValueNullFieldError.checkNotNull(
                  host, r'GetTransportOrderForm', 'host'),
              version: BuiltValueNullFieldError.checkNotNull(
                  version, r'GetTransportOrderForm', 'version'),
              returned: BuiltValueNullFieldError.checkNotNull(
                  returned, r'GetTransportOrderForm', 'returned'),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'GetTransportOrderForm', 'status'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetTransportOrderForm', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
