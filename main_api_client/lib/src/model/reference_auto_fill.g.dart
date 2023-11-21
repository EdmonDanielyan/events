// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference_auto_fill.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReferenceAutoFill extends ReferenceAutoFill {
  @override
  final AutoFillForm? data;
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

  factory _$ReferenceAutoFill(
          [void Function(ReferenceAutoFillBuilder)? updates]) =>
      (new ReferenceAutoFillBuilder()..update(updates))._build();

  _$ReferenceAutoFill._(
      {this.data,
      required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'ReferenceAutoFill', 'success');
    BuiltValueNullFieldError.checkNotNull(host, r'ReferenceAutoFill', 'host');
    BuiltValueNullFieldError.checkNotNull(
        version, r'ReferenceAutoFill', 'version');
    BuiltValueNullFieldError.checkNotNull(
        returned, r'ReferenceAutoFill', 'returned');
    BuiltValueNullFieldError.checkNotNull(
        status, r'ReferenceAutoFill', 'status');
  }

  @override
  ReferenceAutoFill rebuild(void Function(ReferenceAutoFillBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReferenceAutoFillBuilder toBuilder() =>
      new ReferenceAutoFillBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReferenceAutoFill &&
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
    return (newBuiltValueToStringHelper(r'ReferenceAutoFill')
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status))
        .toString();
  }
}

class ReferenceAutoFillBuilder
    implements
        Builder<ReferenceAutoFill, ReferenceAutoFillBuilder>,
        RequiredSuccessBuilder {
  _$ReferenceAutoFill? _$v;

  AutoFillFormBuilder? _data;
  AutoFillFormBuilder get data => _$this._data ??= new AutoFillFormBuilder();
  set data(covariant AutoFillFormBuilder? data) => _$this._data = data;

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

  ReferenceAutoFillBuilder() {
    ReferenceAutoFill._defaults(this);
  }

  ReferenceAutoFillBuilder get _$this {
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
  void replace(covariant ReferenceAutoFill other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReferenceAutoFill;
  }

  @override
  void update(void Function(ReferenceAutoFillBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReferenceAutoFill build() => _build();

  _$ReferenceAutoFill _build() {
    _$ReferenceAutoFill _$result;
    try {
      _$result = _$v ??
          new _$ReferenceAutoFill._(
              data: _data?.build(),
              success: BuiltValueNullFieldError.checkNotNull(
                  success, r'ReferenceAutoFill', 'success'),
              host: BuiltValueNullFieldError.checkNotNull(
                  host, r'ReferenceAutoFill', 'host'),
              version: BuiltValueNullFieldError.checkNotNull(
                  version, r'ReferenceAutoFill', 'version'),
              returned: BuiltValueNullFieldError.checkNotNull(
                  returned, r'ReferenceAutoFill', 'returned'),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'ReferenceAutoFill', 'status'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ReferenceAutoFill', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
