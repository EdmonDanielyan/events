// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movements_fail.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MovementsFail extends MovementsFail {
  @override
  final String code;
  @override
  final String detail;
  @override
  final String title;
  @override
  final int status;
  @override
  final bool success;
  @override
  final String host;
  @override
  final String version;
  @override
  final DateTime returned;
  @override
  final String type;
  @override
  final String instance;

  factory _$MovementsFail([void Function(MovementsFailBuilder)? updates]) =>
      (new MovementsFailBuilder()..update(updates))._build();

  _$MovementsFail._(
      {required this.code,
      required this.detail,
      required this.title,
      required this.status,
      required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.type,
      required this.instance})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(code, r'MovementsFail', 'code');
    BuiltValueNullFieldError.checkNotNull(detail, r'MovementsFail', 'detail');
    BuiltValueNullFieldError.checkNotNull(title, r'MovementsFail', 'title');
    BuiltValueNullFieldError.checkNotNull(status, r'MovementsFail', 'status');
    BuiltValueNullFieldError.checkNotNull(success, r'MovementsFail', 'success');
    BuiltValueNullFieldError.checkNotNull(host, r'MovementsFail', 'host');
    BuiltValueNullFieldError.checkNotNull(version, r'MovementsFail', 'version');
    BuiltValueNullFieldError.checkNotNull(
        returned, r'MovementsFail', 'returned');
    BuiltValueNullFieldError.checkNotNull(type, r'MovementsFail', 'type');
    BuiltValueNullFieldError.checkNotNull(
        instance, r'MovementsFail', 'instance');
  }

  @override
  MovementsFail rebuild(void Function(MovementsFailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovementsFailBuilder toBuilder() => new MovementsFailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MovementsFail &&
        code == other.code &&
        detail == other.detail &&
        title == other.title &&
        status == other.status &&
        success == other.success &&
        host == other.host &&
        version == other.version &&
        returned == other.returned &&
        type == other.type &&
        instance == other.instance;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, detail.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, host.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, returned.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, instance.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MovementsFail')
          ..add('code', code)
          ..add('detail', detail)
          ..add('title', title)
          ..add('status', status)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('type', type)
          ..add('instance', instance))
        .toString();
  }
}

class MovementsFailBuilder
    implements
        Builder<MovementsFail, MovementsFailBuilder>,
        RequiredErrorBuilder {
  _$MovementsFail? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(covariant String? code) => _$this._code = code;

  String? _detail;
  String? get detail => _$this._detail;
  set detail(covariant String? detail) => _$this._detail = detail;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  int? _status;
  int? get status => _$this._status;
  set status(covariant int? status) => _$this._status = status;

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

  String? _type;
  String? get type => _$this._type;
  set type(covariant String? type) => _$this._type = type;

  String? _instance;
  String? get instance => _$this._instance;
  set instance(covariant String? instance) => _$this._instance = instance;

  MovementsFailBuilder() {
    MovementsFail._defaults(this);
  }

  MovementsFailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _detail = $v.detail;
      _title = $v.title;
      _status = $v.status;
      _success = $v.success;
      _host = $v.host;
      _version = $v.version;
      _returned = $v.returned;
      _type = $v.type;
      _instance = $v.instance;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant MovementsFail other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MovementsFail;
  }

  @override
  void update(void Function(MovementsFailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MovementsFail build() => _build();

  _$MovementsFail _build() {
    final _$result = _$v ??
        new _$MovementsFail._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'MovementsFail', 'code'),
            detail: BuiltValueNullFieldError.checkNotNull(
                detail, r'MovementsFail', 'detail'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'MovementsFail', 'title'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'MovementsFail', 'status'),
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'MovementsFail', 'success'),
            host: BuiltValueNullFieldError.checkNotNull(
                host, r'MovementsFail', 'host'),
            version: BuiltValueNullFieldError.checkNotNull(
                version, r'MovementsFail', 'version'),
            returned: BuiltValueNullFieldError.checkNotNull(
                returned, r'MovementsFail', 'returned'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'MovementsFail', 'type'),
            instance: BuiltValueNullFieldError.checkNotNull(
                instance, r'MovementsFail', 'instance'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
