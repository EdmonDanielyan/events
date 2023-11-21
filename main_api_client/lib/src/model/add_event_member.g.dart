// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_event_member.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddEventMember extends AddEventMember {
  @override
  final String? data;
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

  factory _$AddEventMember([void Function(AddEventMemberBuilder)? updates]) =>
      (new AddEventMemberBuilder()..update(updates))._build();

  _$AddEventMember._(
      {this.data,
      required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'AddEventMember', 'success');
    BuiltValueNullFieldError.checkNotNull(host, r'AddEventMember', 'host');
    BuiltValueNullFieldError.checkNotNull(
        version, r'AddEventMember', 'version');
    BuiltValueNullFieldError.checkNotNull(
        returned, r'AddEventMember', 'returned');
    BuiltValueNullFieldError.checkNotNull(status, r'AddEventMember', 'status');
  }

  @override
  AddEventMember rebuild(void Function(AddEventMemberBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddEventMemberBuilder toBuilder() =>
      new AddEventMemberBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddEventMember &&
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
    return (newBuiltValueToStringHelper(r'AddEventMember')
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status))
        .toString();
  }
}

class AddEventMemberBuilder
    implements
        Builder<AddEventMember, AddEventMemberBuilder>,
        RequiredSuccessBuilder {
  _$AddEventMember? _$v;

  String? _data;
  String? get data => _$this._data;
  set data(covariant String? data) => _$this._data = data;

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

  AddEventMemberBuilder() {
    AddEventMember._defaults(this);
  }

  AddEventMemberBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
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
  void replace(covariant AddEventMember other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddEventMember;
  }

  @override
  void update(void Function(AddEventMemberBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddEventMember build() => _build();

  _$AddEventMember _build() {
    final _$result = _$v ??
        new _$AddEventMember._(
            data: data,
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'AddEventMember', 'success'),
            host: BuiltValueNullFieldError.checkNotNull(
                host, r'AddEventMember', 'host'),
            version: BuiltValueNullFieldError.checkNotNull(
                version, r'AddEventMember', 'version'),
            returned: BuiltValueNullFieldError.checkNotNull(
                returned, r'AddEventMember', 'returned'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'AddEventMember', 'status'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
