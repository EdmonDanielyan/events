// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movements_success.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MovementsSuccess extends MovementsSuccess {
  @override
  final BuiltList<MovementsObject>? data;
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

  factory _$MovementsSuccess(
          [void Function(MovementsSuccessBuilder)? updates]) =>
      (new MovementsSuccessBuilder()..update(updates))._build();

  _$MovementsSuccess._(
      {this.data,
      required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'MovementsSuccess', 'success');
    BuiltValueNullFieldError.checkNotNull(host, r'MovementsSuccess', 'host');
    BuiltValueNullFieldError.checkNotNull(
        version, r'MovementsSuccess', 'version');
    BuiltValueNullFieldError.checkNotNull(
        returned, r'MovementsSuccess', 'returned');
    BuiltValueNullFieldError.checkNotNull(
        status, r'MovementsSuccess', 'status');
  }

  @override
  MovementsSuccess rebuild(void Function(MovementsSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovementsSuccessBuilder toBuilder() =>
      new MovementsSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MovementsSuccess &&
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
    return (newBuiltValueToStringHelper(r'MovementsSuccess')
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status))
        .toString();
  }
}

class MovementsSuccessBuilder
    implements
        Builder<MovementsSuccess, MovementsSuccessBuilder>,
        RequiredSuccessBuilder {
  _$MovementsSuccess? _$v;

  ListBuilder<MovementsObject>? _data;
  ListBuilder<MovementsObject> get data =>
      _$this._data ??= new ListBuilder<MovementsObject>();
  set data(covariant ListBuilder<MovementsObject>? data) => _$this._data = data;

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

  MovementsSuccessBuilder() {
    MovementsSuccess._defaults(this);
  }

  MovementsSuccessBuilder get _$this {
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
  void replace(covariant MovementsSuccess other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MovementsSuccess;
  }

  @override
  void update(void Function(MovementsSuccessBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MovementsSuccess build() => _build();

  _$MovementsSuccess _build() {
    _$MovementsSuccess _$result;
    try {
      _$result = _$v ??
          new _$MovementsSuccess._(
              data: _data?.build(),
              success: BuiltValueNullFieldError.checkNotNull(
                  success, r'MovementsSuccess', 'success'),
              host: BuiltValueNullFieldError.checkNotNull(
                  host, r'MovementsSuccess', 'host'),
              version: BuiltValueNullFieldError.checkNotNull(
                  version, r'MovementsSuccess', 'version'),
              returned: BuiltValueNullFieldError.checkNotNull(
                  returned, r'MovementsSuccess', 'returned'),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'MovementsSuccess', 'status'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MovementsSuccess', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
