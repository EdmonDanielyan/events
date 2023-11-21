// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'required_error.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class RequiredErrorBuilder {
  void replace(RequiredError other);
  void update(void Function(RequiredErrorBuilder) updates);
  bool? get success;
  set success(bool? success);

  String? get host;
  set host(String? host);

  String? get version;
  set version(String? version);

  DateTime? get returned;
  set returned(DateTime? returned);

  String? get type;
  set type(String? type);

  String? get instance;
  set instance(String? instance);
}

class _$$RequiredError extends $RequiredError {
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

  factory _$$RequiredError([void Function($RequiredErrorBuilder)? updates]) =>
      (new $RequiredErrorBuilder()..update(updates))._build();

  _$$RequiredError._(
      {required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.type,
      required this.instance})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'$RequiredError', 'success');
    BuiltValueNullFieldError.checkNotNull(host, r'$RequiredError', 'host');
    BuiltValueNullFieldError.checkNotNull(
        version, r'$RequiredError', 'version');
    BuiltValueNullFieldError.checkNotNull(
        returned, r'$RequiredError', 'returned');
    BuiltValueNullFieldError.checkNotNull(type, r'$RequiredError', 'type');
    BuiltValueNullFieldError.checkNotNull(
        instance, r'$RequiredError', 'instance');
  }

  @override
  $RequiredError rebuild(void Function($RequiredErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $RequiredErrorBuilder toBuilder() =>
      new $RequiredErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $RequiredError &&
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
    return (newBuiltValueToStringHelper(r'$RequiredError')
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('type', type)
          ..add('instance', instance))
        .toString();
  }
}

class $RequiredErrorBuilder
    implements
        Builder<$RequiredError, $RequiredErrorBuilder>,
        RequiredErrorBuilder {
  _$$RequiredError? _$v;

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

  $RequiredErrorBuilder() {
    $RequiredError._defaults(this);
  }

  $RequiredErrorBuilder get _$this {
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
  void replace(covariant $RequiredError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$$RequiredError;
  }

  @override
  void update(void Function($RequiredErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $RequiredError build() => _build();

  _$$RequiredError _build() {
    final _$result = _$v ??
        new _$$RequiredError._(
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'$RequiredError', 'success'),
            host: BuiltValueNullFieldError.checkNotNull(
                host, r'$RequiredError', 'host'),
            version: BuiltValueNullFieldError.checkNotNull(
                version, r'$RequiredError', 'version'),
            returned: BuiltValueNullFieldError.checkNotNull(
                returned, r'$RequiredError', 'returned'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'$RequiredError', 'type'),
            instance: BuiltValueNullFieldError.checkNotNull(
                instance, r'$RequiredError', 'instance'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
