// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'global_settings_response_body.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GlobalSettingsResponseBody> _$globalSettingsResponseBodySerializer =
    new _$GlobalSettingsResponseBodySerializer();

class _$GlobalSettingsResponseBodySerializer
    implements StructuredSerializer<GlobalSettingsResponseBody> {
  @override
  final Iterable<Type> types = const [
    GlobalSettingsResponseBody,
    _$GlobalSettingsResponseBody
  ];
  @override
  final String wireName = 'GlobalSettingsResponseBody';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GlobalSettingsResponseBody object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
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
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GlobalSettings)));
    }
    return result;
  }

  @override
  GlobalSettingsResponseBody deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GlobalSettingsResponseBodyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
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
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(GlobalSettings)) as GlobalSettings);
          break;
      }
    }

    return result.build();
  }
}

class _$GlobalSettingsResponseBody extends GlobalSettingsResponseBody {
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
  @override
  final GlobalSettings data;

  factory _$GlobalSettingsResponseBody(
          [void Function(GlobalSettingsResponseBodyBuilder) updates]) =>
      (new GlobalSettingsResponseBodyBuilder()..update(updates))._build();

  _$GlobalSettingsResponseBody._(
      {this.success,
      this.host,
      this.version,
      this.returned,
      this.status,
      this.data})
      : super._();

  @override
  GlobalSettingsResponseBody rebuild(
          void Function(GlobalSettingsResponseBodyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GlobalSettingsResponseBodyBuilder toBuilder() =>
      new GlobalSettingsResponseBodyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GlobalSettingsResponseBody &&
        success == other.success &&
        host == other.host &&
        version == other.version &&
        returned == other.returned &&
        status == other.status &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, host.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, returned.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GlobalSettingsResponseBody')
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status)
          ..add('data', data))
        .toString();
  }
}

class GlobalSettingsResponseBodyBuilder
    implements
        Builder<GlobalSettingsResponseBody, GlobalSettingsResponseBodyBuilder> {
  _$GlobalSettingsResponseBody _$v;

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

  int _status;
  int get status => _$this._status;
  set status(int status) => _$this._status = status;

  GlobalSettingsBuilder _data;
  GlobalSettingsBuilder get data =>
      _$this._data ??= new GlobalSettingsBuilder();
  set data(GlobalSettingsBuilder data) => _$this._data = data;

  GlobalSettingsResponseBodyBuilder() {
    GlobalSettingsResponseBody._initializeBuilder(this);
  }

  GlobalSettingsResponseBodyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _host = $v.host;
      _version = $v.version;
      _returned = $v.returned;
      _status = $v.status;
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GlobalSettingsResponseBody other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GlobalSettingsResponseBody;
  }

  @override
  void update(void Function(GlobalSettingsResponseBodyBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  GlobalSettingsResponseBody build() => _build();

  _$GlobalSettingsResponseBody _build() {
    _$GlobalSettingsResponseBody _$result;
    try {
      _$result = _$v ??
          new _$GlobalSettingsResponseBody._(
              success: success,
              host: host,
              version: version,
              returned: returned,
              status: status,
              data: _data?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GlobalSettingsResponseBody', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
