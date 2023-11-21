// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_notification_config_result_body.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SingleNotificationConfigResultBody
    extends SingleNotificationConfigResultBody {
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
  final NotificationSubState? data;

  factory _$SingleNotificationConfigResultBody(
          [void Function(SingleNotificationConfigResultBodyBuilder)?
              updates]) =>
      (new SingleNotificationConfigResultBodyBuilder()..update(updates))
          ._build();

  _$SingleNotificationConfigResultBody._(
      {required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.status,
      this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'SingleNotificationConfigResultBody', 'success');
    BuiltValueNullFieldError.checkNotNull(
        host, r'SingleNotificationConfigResultBody', 'host');
    BuiltValueNullFieldError.checkNotNull(
        version, r'SingleNotificationConfigResultBody', 'version');
    BuiltValueNullFieldError.checkNotNull(
        returned, r'SingleNotificationConfigResultBody', 'returned');
    BuiltValueNullFieldError.checkNotNull(
        status, r'SingleNotificationConfigResultBody', 'status');
  }

  @override
  SingleNotificationConfigResultBody rebuild(
          void Function(SingleNotificationConfigResultBodyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SingleNotificationConfigResultBodyBuilder toBuilder() =>
      new SingleNotificationConfigResultBodyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SingleNotificationConfigResultBody &&
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
    return (newBuiltValueToStringHelper(r'SingleNotificationConfigResultBody')
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status)
          ..add('data', data))
        .toString();
  }
}

class SingleNotificationConfigResultBodyBuilder
    implements
        Builder<SingleNotificationConfigResultBody,
            SingleNotificationConfigResultBodyBuilder>,
        RequiredSuccessBuilder,
        SingleNotificationConfigResultBodyAllOfBuilder {
  _$SingleNotificationConfigResultBody? _$v;

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

  NotificationSubStateBuilder? _data;
  NotificationSubStateBuilder get data =>
      _$this._data ??= new NotificationSubStateBuilder();
  set data(covariant NotificationSubStateBuilder? data) => _$this._data = data;

  SingleNotificationConfigResultBodyBuilder() {
    SingleNotificationConfigResultBody._defaults(this);
  }

  SingleNotificationConfigResultBodyBuilder get _$this {
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
  void replace(covariant SingleNotificationConfigResultBody other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SingleNotificationConfigResultBody;
  }

  @override
  void update(
      void Function(SingleNotificationConfigResultBodyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SingleNotificationConfigResultBody build() => _build();

  _$SingleNotificationConfigResultBody _build() {
    _$SingleNotificationConfigResultBody _$result;
    try {
      _$result = _$v ??
          new _$SingleNotificationConfigResultBody._(
              success: BuiltValueNullFieldError.checkNotNull(
                  success, r'SingleNotificationConfigResultBody', 'success'),
              host: BuiltValueNullFieldError.checkNotNull(
                  host, r'SingleNotificationConfigResultBody', 'host'),
              version: BuiltValueNullFieldError.checkNotNull(
                  version, r'SingleNotificationConfigResultBody', 'version'),
              returned: BuiltValueNullFieldError.checkNotNull(
                  returned, r'SingleNotificationConfigResultBody', 'returned'),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'SingleNotificationConfigResultBody', 'status'),
              data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SingleNotificationConfigResultBody', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
