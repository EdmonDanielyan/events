// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'movements_success.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MovementsSuccess> _$movementsSuccessSerializer =
    new _$MovementsSuccessSerializer();

class _$MovementsSuccessSerializer
    implements StructuredSerializer<MovementsSuccess> {
  @override
  final Iterable<Type> types = const [MovementsSuccess, _$MovementsSuccess];
  @override
  final String wireName = 'MovementsSuccess';

  @override
  Iterable<Object> serialize(Serializers serializers, MovementsSuccess object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(MovementsObject)])));
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
  MovementsSuccess deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovementsSuccessBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MovementsObject)]))
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
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$MovementsSuccess extends MovementsSuccess {
  @override
  final BuiltList<MovementsObject> data;
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

  factory _$MovementsSuccess(
          [void Function(MovementsSuccessBuilder) updates]) =>
      (new MovementsSuccessBuilder()..update(updates)).build();

  _$MovementsSuccess._(
      {this.data,
      this.success,
      this.host,
      this.version,
      this.returned,
      this.status})
      : super._();

  @override
  MovementsSuccess rebuild(void Function(MovementsSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovementsSuccessBuilder toBuilder() =>
      new MovementsSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MovementsSuccess &&
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
    return (newBuiltValueToStringHelper('MovementsSuccess')
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status))
        .toString();
  }
}

class MovementsSuccessBuilder
    implements Builder<MovementsSuccess, MovementsSuccessBuilder> {
  _$MovementsSuccess _$v;

  ListBuilder<MovementsObject> _data;
  ListBuilder<MovementsObject> get data =>
      _$this._data ??= new ListBuilder<MovementsObject>();
  set data(ListBuilder<MovementsObject> data) => _$this._data = data;

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

  MovementsSuccessBuilder() {
    MovementsSuccess._initializeBuilder(this);
  }

  MovementsSuccessBuilder get _$this {
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
  void replace(MovementsSuccess other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MovementsSuccess;
  }

  @override
  void update(void Function(MovementsSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MovementsSuccess build() {
    _$MovementsSuccess _$result;
    try {
      _$result = _$v ??
          new _$MovementsSuccess._(
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
            'MovementsSuccess', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
