// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_notifications_config_result_body.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AllNotificationsConfigResultBody
    extends AllNotificationsConfigResultBody {
  @override
  final NotificationFullList? data;
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

  factory _$AllNotificationsConfigResultBody(
          [void Function(AllNotificationsConfigResultBodyBuilder)? updates]) =>
      (new AllNotificationsConfigResultBodyBuilder()..update(updates))._build();

  _$AllNotificationsConfigResultBody._(
      {this.data,
      required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'AllNotificationsConfigResultBody', 'success');
    BuiltValueNullFieldError.checkNotNull(
        host, r'AllNotificationsConfigResultBody', 'host');
    BuiltValueNullFieldError.checkNotNull(
        version, r'AllNotificationsConfigResultBody', 'version');
    BuiltValueNullFieldError.checkNotNull(
        returned, r'AllNotificationsConfigResultBody', 'returned');
    BuiltValueNullFieldError.checkNotNull(
        status, r'AllNotificationsConfigResultBody', 'status');
  }

  @override
  AllNotificationsConfigResultBody rebuild(
          void Function(AllNotificationsConfigResultBodyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AllNotificationsConfigResultBodyBuilder toBuilder() =>
      new AllNotificationsConfigResultBodyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AllNotificationsConfigResultBody &&
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
    return (newBuiltValueToStringHelper(r'AllNotificationsConfigResultBody')
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status))
        .toString();
  }
}

class AllNotificationsConfigResultBodyBuilder
    implements
        Builder<AllNotificationsConfigResultBody,
            AllNotificationsConfigResultBodyBuilder>,
        AllNotificationsConfigResultBodyAllOfBuilder,
        RequiredSuccessBuilder {
  _$AllNotificationsConfigResultBody? _$v;

  NotificationFullListBuilder? _data;
  NotificationFullListBuilder get data =>
      _$this._data ??= new NotificationFullListBuilder();
  set data(covariant NotificationFullListBuilder? data) => _$this._data = data;

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

  AllNotificationsConfigResultBodyBuilder() {
    AllNotificationsConfigResultBody._defaults(this);
  }

  AllNotificationsConfigResultBodyBuilder get _$this {
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
  void replace(covariant AllNotificationsConfigResultBody other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AllNotificationsConfigResultBody;
  }

  @override
  void update(void Function(AllNotificationsConfigResultBodyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AllNotificationsConfigResultBody build() => _build();

  _$AllNotificationsConfigResultBody _build() {
    _$AllNotificationsConfigResultBody _$result;
    try {
      _$result = _$v ??
          new _$AllNotificationsConfigResultBody._(
              data: _data?.build(),
              success: BuiltValueNullFieldError.checkNotNull(
                  success, r'AllNotificationsConfigResultBody', 'success'),
              host: BuiltValueNullFieldError.checkNotNull(
                  host, r'AllNotificationsConfigResultBody', 'host'),
              version: BuiltValueNullFieldError.checkNotNull(
                  version, r'AllNotificationsConfigResultBody', 'version'),
              returned: BuiltValueNullFieldError.checkNotNull(
                  returned, r'AllNotificationsConfigResultBody', 'returned'),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'AllNotificationsConfigResultBody', 'status'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AllNotificationsConfigResultBody', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
