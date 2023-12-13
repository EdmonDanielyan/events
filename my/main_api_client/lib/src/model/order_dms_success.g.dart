// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dms_success.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OrderDMSSuccess extends OrderDMSSuccess {
  @override
  final String? data;
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

  factory _$OrderDMSSuccess([void Function(OrderDMSSuccessBuilder)? updates]) =>
      (new OrderDMSSuccessBuilder()..update(updates))._build();

  _$OrderDMSSuccess._(
      {this.data,
      required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'OrderDMSSuccess', 'success');
    BuiltValueNullFieldError.checkNotNull(host, r'OrderDMSSuccess', 'host');
    BuiltValueNullFieldError.checkNotNull(
        version, r'OrderDMSSuccess', 'version');
    BuiltValueNullFieldError.checkNotNull(
        returned, r'OrderDMSSuccess', 'returned');
    BuiltValueNullFieldError.checkNotNull(status, r'OrderDMSSuccess', 'status');
  }

  @override
  OrderDMSSuccess rebuild(void Function(OrderDMSSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderDMSSuccessBuilder toBuilder() =>
      new OrderDMSSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderDMSSuccess &&
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
    return (newBuiltValueToStringHelper(r'OrderDMSSuccess')
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status))
        .toString();
  }
}

class OrderDMSSuccessBuilder
    implements
        Builder<OrderDMSSuccess, OrderDMSSuccessBuilder>,
        RequiredSuccessBuilder {
  _$OrderDMSSuccess? _$v;

  String? _data;
  String? get data => _$this._data;
  set data(covariant String? data) => _$this._data = data;

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

  OrderDMSSuccessBuilder() {
    OrderDMSSuccess._defaults(this);
  }

  OrderDMSSuccessBuilder get _$this {
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
  void replace(covariant OrderDMSSuccess other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrderDMSSuccess;
  }

  @override
  void update(void Function(OrderDMSSuccessBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderDMSSuccess build() => _build();

  _$OrderDMSSuccess _build() {
    final _$result = _$v ??
        new _$OrderDMSSuccess._(
            data: data,
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'OrderDMSSuccess', 'success'),
            host: BuiltValueNullFieldError.checkNotNull(
                host, r'OrderDMSSuccess', 'host'),
            version: BuiltValueNullFieldError.checkNotNull(
                version, r'OrderDMSSuccess', 'version'),
            returned: BuiltValueNullFieldError.checkNotNull(
                returned, r'OrderDMSSuccess', 'returned'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'OrderDMSSuccess', 'status'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
