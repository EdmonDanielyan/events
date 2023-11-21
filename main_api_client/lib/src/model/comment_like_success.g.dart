// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_like_success.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CommentLikeSuccess extends CommentLikeSuccess {
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

  factory _$CommentLikeSuccess(
          [void Function(CommentLikeSuccessBuilder)? updates]) =>
      (new CommentLikeSuccessBuilder()..update(updates))._build();

  _$CommentLikeSuccess._(
      {this.data,
      required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'CommentLikeSuccess', 'success');
    BuiltValueNullFieldError.checkNotNull(host, r'CommentLikeSuccess', 'host');
    BuiltValueNullFieldError.checkNotNull(
        version, r'CommentLikeSuccess', 'version');
    BuiltValueNullFieldError.checkNotNull(
        returned, r'CommentLikeSuccess', 'returned');
    BuiltValueNullFieldError.checkNotNull(
        status, r'CommentLikeSuccess', 'status');
  }

  @override
  CommentLikeSuccess rebuild(
          void Function(CommentLikeSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentLikeSuccessBuilder toBuilder() =>
      new CommentLikeSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommentLikeSuccess &&
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
    return (newBuiltValueToStringHelper(r'CommentLikeSuccess')
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status))
        .toString();
  }
}

class CommentLikeSuccessBuilder
    implements
        Builder<CommentLikeSuccess, CommentLikeSuccessBuilder>,
        RequiredSuccessBuilder {
  _$CommentLikeSuccess? _$v;

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

  CommentLikeSuccessBuilder() {
    CommentLikeSuccess._defaults(this);
  }

  CommentLikeSuccessBuilder get _$this {
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
  void replace(covariant CommentLikeSuccess other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommentLikeSuccess;
  }

  @override
  void update(void Function(CommentLikeSuccessBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CommentLikeSuccess build() => _build();

  _$CommentLikeSuccess _build() {
    final _$result = _$v ??
        new _$CommentLikeSuccess._(
            data: data,
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'CommentLikeSuccess', 'success'),
            host: BuiltValueNullFieldError.checkNotNull(
                host, r'CommentLikeSuccess', 'host'),
            version: BuiltValueNullFieldError.checkNotNull(
                version, r'CommentLikeSuccess', 'version'),
            returned: BuiltValueNullFieldError.checkNotNull(
                returned, r'CommentLikeSuccess', 'returned'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'CommentLikeSuccess', 'status'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
