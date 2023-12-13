// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_error.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericError extends GenericError {
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

  factory _$GenericError([void Function(GenericErrorBuilder)? updates]) =>
      (new GenericErrorBuilder()..update(updates))._build();

  _$GenericError._(
      {required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.type,
      required this.instance})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(success, r'GenericError', 'success');
    BuiltValueNullFieldError.checkNotNull(host, r'GenericError', 'host');
    BuiltValueNullFieldError.checkNotNull(version, r'GenericError', 'version');
    BuiltValueNullFieldError.checkNotNull(
        returned, r'GenericError', 'returned');
    BuiltValueNullFieldError.checkNotNull(type, r'GenericError', 'type');
    BuiltValueNullFieldError.checkNotNull(
        instance, r'GenericError', 'instance');
  }

  @override
  GenericError rebuild(void Function(GenericErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericErrorBuilder toBuilder() => new GenericErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericError &&
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
    return (newBuiltValueToStringHelper(r'GenericError')
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('type', type)
          ..add('instance', instance))
        .toString();
  }
}

class GenericErrorBuilder
    implements
        Builder<GenericError, GenericErrorBuilder>,
        RequiredErrorBuilder {
  _$GenericError? _$v;

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

  GenericErrorBuilder() {
    GenericError._defaults(this);
  }

  GenericErrorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
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
  void replace(covariant GenericError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GenericError;
  }

  @override
  void update(void Function(GenericErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericError build() => _build();

  _$GenericError _build() {
    final _$result = _$v ??
        new _$GenericError._(
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'GenericError', 'success'),
            host: BuiltValueNullFieldError.checkNotNull(
                host, r'GenericError', 'host'),
            version: BuiltValueNullFieldError.checkNotNull(
                version, r'GenericError', 'version'),
            returned: BuiltValueNullFieldError.checkNotNull(
                returned, r'GenericError', 'returned'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'GenericError', 'type'),
            instance: BuiltValueNullFieldError.checkNotNull(
                instance, r'GenericError', 'instance'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
