// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bad_id.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BadId extends BadId {
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

  factory _$BadId([void Function(BadIdBuilder)? updates]) =>
      (new BadIdBuilder()..update(updates))._build();

  _$BadId._(
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
    BuiltValueNullFieldError.checkNotNull(code, r'BadId', 'code');
    BuiltValueNullFieldError.checkNotNull(detail, r'BadId', 'detail');
    BuiltValueNullFieldError.checkNotNull(title, r'BadId', 'title');
    BuiltValueNullFieldError.checkNotNull(status, r'BadId', 'status');
    BuiltValueNullFieldError.checkNotNull(success, r'BadId', 'success');
    BuiltValueNullFieldError.checkNotNull(host, r'BadId', 'host');
    BuiltValueNullFieldError.checkNotNull(version, r'BadId', 'version');
    BuiltValueNullFieldError.checkNotNull(returned, r'BadId', 'returned');
    BuiltValueNullFieldError.checkNotNull(type, r'BadId', 'type');
    BuiltValueNullFieldError.checkNotNull(instance, r'BadId', 'instance');
  }

  @override
  BadId rebuild(void Function(BadIdBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BadIdBuilder toBuilder() => new BadIdBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BadId &&
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
    return (newBuiltValueToStringHelper(r'BadId')
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

class BadIdBuilder
    implements Builder<BadId, BadIdBuilder>, RequiredErrorBuilder {
  _$BadId? _$v;

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

  BadIdBuilder() {
    BadId._defaults(this);
  }

  BadIdBuilder get _$this {
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
  void replace(covariant BadId other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BadId;
  }

  @override
  void update(void Function(BadIdBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BadId build() => _build();

  _$BadId _build() {
    final _$result = _$v ??
        new _$BadId._(
            code: BuiltValueNullFieldError.checkNotNull(code, r'BadId', 'code'),
            detail: BuiltValueNullFieldError.checkNotNull(
                detail, r'BadId', 'detail'),
            title:
                BuiltValueNullFieldError.checkNotNull(title, r'BadId', 'title'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'BadId', 'status'),
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'BadId', 'success'),
            host: BuiltValueNullFieldError.checkNotNull(host, r'BadId', 'host'),
            version: BuiltValueNullFieldError.checkNotNull(
                version, r'BadId', 'version'),
            returned: BuiltValueNullFieldError.checkNotNull(
                returned, r'BadId', 'returned'),
            type: BuiltValueNullFieldError.checkNotNull(type, r'BadId', 'type'),
            instance: BuiltValueNullFieldError.checkNotNull(
                instance, r'BadId', 'instance'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
