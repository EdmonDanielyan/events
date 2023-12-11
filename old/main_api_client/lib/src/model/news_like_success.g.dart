// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_like_success.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NewsLikeSuccess extends NewsLikeSuccess {
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

  factory _$NewsLikeSuccess([void Function(NewsLikeSuccessBuilder)? updates]) =>
      (new NewsLikeSuccessBuilder()..update(updates))._build();

  _$NewsLikeSuccess._(
      {this.data,
      required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'NewsLikeSuccess', 'success');
    BuiltValueNullFieldError.checkNotNull(host, r'NewsLikeSuccess', 'host');
    BuiltValueNullFieldError.checkNotNull(
        version, r'NewsLikeSuccess', 'version');
    BuiltValueNullFieldError.checkNotNull(
        returned, r'NewsLikeSuccess', 'returned');
    BuiltValueNullFieldError.checkNotNull(status, r'NewsLikeSuccess', 'status');
  }

  @override
  NewsLikeSuccess rebuild(void Function(NewsLikeSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewsLikeSuccessBuilder toBuilder() =>
      new NewsLikeSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsLikeSuccess &&
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
    return (newBuiltValueToStringHelper(r'NewsLikeSuccess')
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status))
        .toString();
  }
}

class NewsLikeSuccessBuilder
    implements
        Builder<NewsLikeSuccess, NewsLikeSuccessBuilder>,
        RequiredSuccessBuilder {
  _$NewsLikeSuccess? _$v;

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

  NewsLikeSuccessBuilder() {
    NewsLikeSuccess._defaults(this);
  }

  NewsLikeSuccessBuilder get _$this {
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
  void replace(covariant NewsLikeSuccess other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NewsLikeSuccess;
  }

  @override
  void update(void Function(NewsLikeSuccessBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NewsLikeSuccess build() => _build();

  _$NewsLikeSuccess _build() {
    final _$result = _$v ??
        new _$NewsLikeSuccess._(
            data: data,
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'NewsLikeSuccess', 'success'),
            host: BuiltValueNullFieldError.checkNotNull(
                host, r'NewsLikeSuccess', 'host'),
            version: BuiltValueNullFieldError.checkNotNull(
                version, r'NewsLikeSuccess', 'version'),
            returned: BuiltValueNullFieldError.checkNotNull(
                returned, r'NewsLikeSuccess', 'returned'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'NewsLikeSuccess', 'status'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
