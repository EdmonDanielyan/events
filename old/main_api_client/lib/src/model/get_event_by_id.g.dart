// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_event_by_id.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetEventById extends GetEventById {
  @override
  final EventProperty data;
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

  factory _$GetEventById([void Function(GetEventByIdBuilder)? updates]) =>
      (new GetEventByIdBuilder()..update(updates))._build();

  _$GetEventById._(
      {required this.data,
      required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'GetEventById', 'data');
    BuiltValueNullFieldError.checkNotNull(success, r'GetEventById', 'success');
    BuiltValueNullFieldError.checkNotNull(host, r'GetEventById', 'host');
    BuiltValueNullFieldError.checkNotNull(version, r'GetEventById', 'version');
    BuiltValueNullFieldError.checkNotNull(
        returned, r'GetEventById', 'returned');
    BuiltValueNullFieldError.checkNotNull(status, r'GetEventById', 'status');
  }

  @override
  GetEventById rebuild(void Function(GetEventByIdBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetEventByIdBuilder toBuilder() => new GetEventByIdBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetEventById &&
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
    return (newBuiltValueToStringHelper(r'GetEventById')
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status))
        .toString();
  }
}

class GetEventByIdBuilder
    implements
        Builder<GetEventById, GetEventByIdBuilder>,
        RequiredSuccessBuilder {
  _$GetEventById? _$v;

  EventPropertyBuilder? _data;
  EventPropertyBuilder get data => _$this._data ??= new EventPropertyBuilder();
  set data(covariant EventPropertyBuilder? data) => _$this._data = data;

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

  GetEventByIdBuilder() {
    GetEventById._defaults(this);
  }

  GetEventByIdBuilder get _$this {
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
  void replace(covariant GetEventById other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetEventById;
  }

  @override
  void update(void Function(GetEventByIdBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetEventById build() => _build();

  _$GetEventById _build() {
    _$GetEventById _$result;
    try {
      _$result = _$v ??
          new _$GetEventById._(
              data: data.build(),
              success: BuiltValueNullFieldError.checkNotNull(
                  success, r'GetEventById', 'success'),
              host: BuiltValueNullFieldError.checkNotNull(
                  host, r'GetEventById', 'host'),
              version: BuiltValueNullFieldError.checkNotNull(
                  version, r'GetEventById', 'version'),
              returned: BuiltValueNullFieldError.checkNotNull(
                  returned, r'GetEventById', 'returned'),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'GetEventById', 'status'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetEventById', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
