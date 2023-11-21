// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_announcement_by_id.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetAnnouncementById extends GetAnnouncementById {
  @override
  final AnnouncementProperty data;
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

  factory _$GetAnnouncementById(
          [void Function(GetAnnouncementByIdBuilder)? updates]) =>
      (new GetAnnouncementByIdBuilder()..update(updates))._build();

  _$GetAnnouncementById._(
      {required this.data,
      required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'GetAnnouncementById', 'data');
    BuiltValueNullFieldError.checkNotNull(
        success, r'GetAnnouncementById', 'success');
    BuiltValueNullFieldError.checkNotNull(host, r'GetAnnouncementById', 'host');
    BuiltValueNullFieldError.checkNotNull(
        version, r'GetAnnouncementById', 'version');
    BuiltValueNullFieldError.checkNotNull(
        returned, r'GetAnnouncementById', 'returned');
    BuiltValueNullFieldError.checkNotNull(
        status, r'GetAnnouncementById', 'status');
  }

  @override
  GetAnnouncementById rebuild(
          void Function(GetAnnouncementByIdBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetAnnouncementByIdBuilder toBuilder() =>
      new GetAnnouncementByIdBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetAnnouncementById &&
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
    return (newBuiltValueToStringHelper(r'GetAnnouncementById')
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status))
        .toString();
  }
}

class GetAnnouncementByIdBuilder
    implements
        Builder<GetAnnouncementById, GetAnnouncementByIdBuilder>,
        RequiredSuccessBuilder {
  _$GetAnnouncementById? _$v;

  AnnouncementPropertyBuilder? _data;
  AnnouncementPropertyBuilder get data =>
      _$this._data ??= new AnnouncementPropertyBuilder();
  set data(covariant AnnouncementPropertyBuilder? data) => _$this._data = data;

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

  GetAnnouncementByIdBuilder() {
    GetAnnouncementById._defaults(this);
  }

  GetAnnouncementByIdBuilder get _$this {
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
  void replace(covariant GetAnnouncementById other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetAnnouncementById;
  }

  @override
  void update(void Function(GetAnnouncementByIdBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetAnnouncementById build() => _build();

  _$GetAnnouncementById _build() {
    _$GetAnnouncementById _$result;
    try {
      _$result = _$v ??
          new _$GetAnnouncementById._(
              data: data.build(),
              success: BuiltValueNullFieldError.checkNotNull(
                  success, r'GetAnnouncementById', 'success'),
              host: BuiltValueNullFieldError.checkNotNull(
                  host, r'GetAnnouncementById', 'host'),
              version: BuiltValueNullFieldError.checkNotNull(
                  version, r'GetAnnouncementById', 'version'),
              returned: BuiltValueNullFieldError.checkNotNull(
                  returned, r'GetAnnouncementById', 'returned'),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'GetAnnouncementById', 'status'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetAnnouncementById', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
