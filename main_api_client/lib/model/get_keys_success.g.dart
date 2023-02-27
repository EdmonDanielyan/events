// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'get_keys_success.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GetKeysSuccess> _$getKeysSuccessSerializer =
    new _$GetKeysSuccessSerializer();

class _$GetKeysSuccessSerializer
    implements StructuredSerializer<GetKeysSuccess> {
  @override
  final Iterable<Type> types = const [GetKeysSuccess, _$GetKeysSuccess];
  @override
  final String wireName = 'GetKeysSuccess';

  @override
  Iterable<Object> serialize(Serializers serializers, GetKeysSuccess object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
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
            specifiedType: const FullType(JsonObject)));
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
    return result;
  }

  @override
  GetKeysSuccess deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GetKeysSuccessBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'data':
          result.data = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject)) as JsonObject;
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
      }
    }

    return result.build();
  }
}

class _$GetKeysSuccess extends GetKeysSuccess {
  @override
  final int status;
  @override
  final JsonObject data;
  @override
  final bool success;
  @override
  final String host;
  @override
  final String version;
  @override
  final DateTime returned;

  factory _$GetKeysSuccess([void Function(GetKeysSuccessBuilder) updates]) =>
      (new GetKeysSuccessBuilder()..update(updates))._build();

  _$GetKeysSuccess._(
      {this.status,
      this.data,
      this.success,
      this.host,
      this.version,
      this.returned})
      : super._();

  @override
  GetKeysSuccess rebuild(void Function(GetKeysSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetKeysSuccessBuilder toBuilder() =>
      new GetKeysSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetKeysSuccess &&
        status == other.status &&
        data == other.data &&
        success == other.success &&
        host == other.host &&
        version == other.version &&
        returned == other.returned;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, host.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, returned.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetKeysSuccess')
          ..add('status', status)
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned))
        .toString();
  }
}

class GetKeysSuccessBuilder
    implements Builder<GetKeysSuccess, GetKeysSuccessBuilder> {
  _$GetKeysSuccess _$v;

  int _status;
  int get status => _$this._status;
  set status(int status) => _$this._status = status;

  JsonObject _data;
  JsonObject get data => _$this._data;
  set data(JsonObject data) => _$this._data = data;

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

  GetKeysSuccessBuilder() {
    GetKeysSuccess._initializeBuilder(this);
  }

  GetKeysSuccessBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _data = $v.data;
      _success = $v.success;
      _host = $v.host;
      _version = $v.version;
      _returned = $v.returned;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetKeysSuccess other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetKeysSuccess;
  }

  @override
  void update(void Function(GetKeysSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  GetKeysSuccess build() => _build();

  _$GetKeysSuccess _build() {
    final _$result = _$v ??
        new _$GetKeysSuccess._(
            status: status,
            data: data,
            success: success,
            host: host,
            version: version,
            returned: returned);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
