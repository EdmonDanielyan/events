// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'get_user_success.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GetUserSuccess> _$getUserSuccessSerializer =
    new _$GetUserSuccessSerializer();

class _$GetUserSuccessSerializer
    implements StructuredSerializer<GetUserSuccess> {
  @override
  final Iterable<Type> types = const [GetUserSuccess, _$GetUserSuccess];
  @override
  final String wireName = 'GetUserSuccess';

  @override
  Iterable<Object> serialize(Serializers serializers, GetUserSuccess object,
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
  GetUserSuccess deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GetUserSuccessBuilder();

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

class _$GetUserSuccess extends GetUserSuccess {
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

  factory _$GetUserSuccess([void Function(GetUserSuccessBuilder) updates]) =>
      (new GetUserSuccessBuilder()..update(updates)).build();

  _$GetUserSuccess._(
      {this.status,
      this.data,
      this.success,
      this.host,
      this.version,
      this.returned})
      : super._();

  @override
  GetUserSuccess rebuild(void Function(GetUserSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetUserSuccessBuilder toBuilder() =>
      new GetUserSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetUserSuccess &&
        status == other.status &&
        data == other.data &&
        success == other.success &&
        host == other.host &&
        version == other.version &&
        returned == other.returned;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, status.hashCode), data.hashCode),
                    success.hashCode),
                host.hashCode),
            version.hashCode),
        returned.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GetUserSuccess')
          ..add('status', status)
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned))
        .toString();
  }
}

class GetUserSuccessBuilder
    implements Builder<GetUserSuccess, GetUserSuccessBuilder> {
  _$GetUserSuccess _$v;

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

  GetUserSuccessBuilder() {
    GetUserSuccess._initializeBuilder(this);
  }

  GetUserSuccessBuilder get _$this {
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
  void replace(GetUserSuccess other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetUserSuccess;
  }

  @override
  void update(void Function(GetUserSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GetUserSuccess build() {
    final _$result = _$v ??
        new _$GetUserSuccess._(
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
