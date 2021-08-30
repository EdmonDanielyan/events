// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'get_event_by_id.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GetEventById> _$getEventByIdSerializer =
    new _$GetEventByIdSerializer();

class _$GetEventByIdSerializer implements StructuredSerializer<GetEventById> {
  @override
  final Iterable<Type> types = const [GetEventById, _$GetEventById];
  @override
  final String wireName = 'GetEventById';

  @override
  Iterable<Object> serialize(Serializers serializers, GetEventById object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(EventProperty)));
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
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GetEventById deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GetEventByIdBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(EventProperty)) as EventProperty);
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
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GetEventById extends GetEventById {
  @override
  final EventProperty data;
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

  factory _$GetEventById([void Function(GetEventByIdBuilder) updates]) =>
      (new GetEventByIdBuilder()..update(updates)).build();

  _$GetEventById._(
      {this.data,
      this.success,
      this.host,
      this.version,
      this.returned,
      this.status})
      : super._();

  @override
  GetEventById rebuild(void Function(GetEventByIdBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetEventByIdBuilder toBuilder() => new GetEventByIdBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetEventById &&
        data == other.data &&
        success == other.success &&
        host == other.host &&
        version == other.version &&
        returned == other.returned &&
        status == other.status;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, data.hashCode), success.hashCode),
                    host.hashCode),
                version.hashCode),
            returned.hashCode),
        status.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GetEventById')
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status))
        .toString();
  }
}

class GetEventByIdBuilder
    implements Builder<GetEventById, GetEventByIdBuilder> {
  _$GetEventById _$v;

  EventPropertyBuilder _data;
  EventPropertyBuilder get data => _$this._data ??= new EventPropertyBuilder();
  set data(EventPropertyBuilder data) => _$this._data = data;

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

  GetEventByIdBuilder() {
    GetEventById._initializeBuilder(this);
  }

  GetEventByIdBuilder get _$this {
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
  void replace(GetEventById other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetEventById;
  }

  @override
  void update(void Function(GetEventByIdBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GetEventById build() {
    _$GetEventById _$result;
    try {
      _$result = _$v ??
          new _$GetEventById._(
              data: _data?.build(),
              success: success,
              host: host,
              version: version,
              returned: returned,
              status: status);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GetEventById', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
