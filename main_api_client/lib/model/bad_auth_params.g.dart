// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'bad_auth_params.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BadAuthParams> _$badAuthParamsSerializer =
    new _$BadAuthParamsSerializer();

class _$BadAuthParamsSerializer implements StructuredSerializer<BadAuthParams> {
  @override
  final Iterable<Type> types = const [BadAuthParams, _$BadAuthParams];
  @override
  final String wireName = 'BadAuthParams';

  @override
  Iterable<Object> serialize(Serializers serializers, BadAuthParams object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.detail;
    if (value != null) {
      result
        ..add('detail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.success;
    if (value != null) {
      result
        ..add('success')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.host;
    if (value != null) {
      result
        ..add('host')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.version;
    if (value != null) {
      result
        ..add('version')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.returned;
    if (value != null) {
      result
        ..add('returned')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.instance;
    if (value != null) {
      result
        ..add('instance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  BadAuthParams deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BadAuthParamsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'detail':
          result.detail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'success':
          result.success = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'host':
          result.host = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'version':
          result.version = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'returned':
          result.returned = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'instance':
          result.instance = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$BadAuthParams extends BadAuthParams {
  @override
  final String title;
  @override
  final String detail;
  @override
  final int status;
  @override
  final String code;
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

  factory _$BadAuthParams([void Function(BadAuthParamsBuilder) updates]) =>
      (new BadAuthParamsBuilder()..update(updates))._build();

  _$BadAuthParams._(
      {this.title,
      this.detail,
      this.status,
      this.code,
      this.success,
      this.host,
      this.version,
      this.returned,
      this.type,
      this.instance})
      : super._();

  @override
  BadAuthParams rebuild(void Function(BadAuthParamsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BadAuthParamsBuilder toBuilder() => new BadAuthParamsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BadAuthParams &&
        title == other.title &&
        detail == other.detail &&
        status == other.status &&
        code == other.code &&
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
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, detail.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
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
    return (newBuiltValueToStringHelper(r'BadAuthParams')
          ..add('title', title)
          ..add('detail', detail)
          ..add('status', status)
          ..add('code', code)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('type', type)
          ..add('instance', instance))
        .toString();
  }
}

class BadAuthParamsBuilder
    implements Builder<BadAuthParams, BadAuthParamsBuilder> {
  _$BadAuthParams _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _detail;
  String get detail => _$this._detail;
  set detail(String detail) => _$this._detail = detail;

  int _status;
  int get status => _$this._status;
  set status(int status) => _$this._status = status;

  String _code;
  String get code => _$this._code;
  set code(String code) => _$this._code = code;

  bool _success;
  bool get success => _$this._success;
  set success(bool success) => _$this._success = success;

  String _host;
  String get host => _$this._host;
  set host(String host) => _$this._host = host;

  String _version;
  String get version => _$this._version;
  set version(String version) => _$this._version = version;

  DateTime _returned;
  DateTime get returned => _$this._returned;
  set returned(DateTime returned) => _$this._returned = returned;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _instance;
  String get instance => _$this._instance;
  set instance(String instance) => _$this._instance = instance;

  BadAuthParamsBuilder() {
    BadAuthParams._initializeBuilder(this);
  }

  BadAuthParamsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _detail = $v.detail;
      _status = $v.status;
      _code = $v.code;
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
  void replace(BadAuthParams other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BadAuthParams;
  }

  @override
  void update(void Function(BadAuthParamsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  BadAuthParams build() => _build();

  _$BadAuthParams _build() {
    final _$result = _$v ??
        new _$BadAuthParams._(
            title: title,
            detail: detail,
            status: status,
            code: code,
            success: success,
            host: host,
            version: version,
            returned: returned,
            type: type,
            instance: instance);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
