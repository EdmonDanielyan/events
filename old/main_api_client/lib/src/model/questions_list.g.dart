// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_list.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$QuestionsList extends QuestionsList {
  @override
  final BuiltList<QuestionsListData>? data;
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

  factory _$QuestionsList([void Function(QuestionsListBuilder)? updates]) =>
      (new QuestionsListBuilder()..update(updates))._build();

  _$QuestionsList._(
      {this.data,
      required this.success,
      required this.host,
      required this.version,
      required this.returned,
      required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(success, r'QuestionsList', 'success');
    BuiltValueNullFieldError.checkNotNull(host, r'QuestionsList', 'host');
    BuiltValueNullFieldError.checkNotNull(version, r'QuestionsList', 'version');
    BuiltValueNullFieldError.checkNotNull(
        returned, r'QuestionsList', 'returned');
    BuiltValueNullFieldError.checkNotNull(status, r'QuestionsList', 'status');
  }

  @override
  QuestionsList rebuild(void Function(QuestionsListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuestionsListBuilder toBuilder() => new QuestionsListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QuestionsList &&
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
    return (newBuiltValueToStringHelper(r'QuestionsList')
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status))
        .toString();
  }
}

class QuestionsListBuilder
    implements
        Builder<QuestionsList, QuestionsListBuilder>,
        RequiredSuccessBuilder {
  _$QuestionsList? _$v;

  ListBuilder<QuestionsListData>? _data;
  ListBuilder<QuestionsListData> get data =>
      _$this._data ??= new ListBuilder<QuestionsListData>();
  set data(covariant ListBuilder<QuestionsListData>? data) =>
      _$this._data = data;

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

  QuestionsListBuilder() {
    QuestionsList._defaults(this);
  }

  QuestionsListBuilder get _$this {
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
  void replace(covariant QuestionsList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$QuestionsList;
  }

  @override
  void update(void Function(QuestionsListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  QuestionsList build() => _build();

  _$QuestionsList _build() {
    _$QuestionsList _$result;
    try {
      _$result = _$v ??
          new _$QuestionsList._(
              data: _data?.build(),
              success: BuiltValueNullFieldError.checkNotNull(
                  success, r'QuestionsList', 'success'),
              host: BuiltValueNullFieldError.checkNotNull(
                  host, r'QuestionsList', 'host'),
              version: BuiltValueNullFieldError.checkNotNull(
                  version, r'QuestionsList', 'version'),
              returned: BuiltValueNullFieldError.checkNotNull(
                  returned, r'QuestionsList', 'returned'),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'QuestionsList', 'status'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'QuestionsList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
