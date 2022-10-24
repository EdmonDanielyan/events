// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'get_users_success.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GetUsersSuccess> _$getUsersSuccessSerializer =
    new _$GetUsersSuccessSerializer();

class _$GetUsersSuccessSerializer
    implements StructuredSerializer<GetUsersSuccess> {
  @override
  final Iterable<Type> types = const [GetUsersSuccess, _$GetUsersSuccess];
  @override
  final String wireName = 'GetUsersSuccess';

  @override
  Iterable<Object> serialize(Serializers serializers, GetUsersSuccess object,
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
            specifiedType:
                const FullType(BuiltList, const [const FullType(JsonObject)])));
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
  GetUsersSuccess deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GetUsersSuccessBuilder();

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
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(JsonObject)]))
              as BuiltList<Object>);
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

class _$GetUsersSuccess extends GetUsersSuccess {
  @override
  final int status;
  @override
  final BuiltList<JsonObject> data;
  @override
  final bool success;
  @override
  final String host;
  @override
  final String version;
  @override
  final DateTime returned;

  factory _$GetUsersSuccess([void Function(GetUsersSuccessBuilder) updates]) =>
      (new GetUsersSuccessBuilder()..update(updates))._build();

  _$GetUsersSuccess._(
      {this.status,
      this.data,
      this.success,
      this.host,
      this.version,
      this.returned})
      : super._();

  @override
  GetUsersSuccess rebuild(void Function(GetUsersSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetUsersSuccessBuilder toBuilder() =>
      new GetUsersSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetUsersSuccess &&
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
    return (newBuiltValueToStringHelper(r'GetUsersSuccess')
          ..add('status', status)
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned))
        .toString();
  }
}

class GetUsersSuccessBuilder
    implements Builder<GetUsersSuccess, GetUsersSuccessBuilder> {
  _$GetUsersSuccess _$v;

  int _status;
  int get status => _$this._status;
  set status(int status) => _$this._status = status;

  ListBuilder<JsonObject> _data;
  ListBuilder<JsonObject> get data =>
      _$this._data ??= new ListBuilder<JsonObject>();
  set data(ListBuilder<JsonObject> data) => _$this._data = data;

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

  GetUsersSuccessBuilder() {
    GetUsersSuccess._initializeBuilder(this);
  }

  GetUsersSuccessBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _data = $v.data?.toBuilder();
      _success = $v.success;
      _host = $v.host;
      _version = $v.version;
      _returned = $v.returned;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetUsersSuccess other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetUsersSuccess;
  }

  @override
  void update(void Function(GetUsersSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  GetUsersSuccess build() => _build();

  _$GetUsersSuccess _build() {
    _$GetUsersSuccess _$result;
    try {
      _$result = _$v ??
          new _$GetUsersSuccess._(
              status: status,
              data: _data?.build(),
              success: success,
              host: host,
              version: version,
              returned: returned);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetUsersSuccess', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
