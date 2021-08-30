// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'birthdays_success.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BirthdaysSuccess> _$birthdaysSuccessSerializer =
    new _$BirthdaysSuccessSerializer();

class _$BirthdaysSuccessSerializer
    implements StructuredSerializer<BirthdaysSuccess> {
  @override
  final Iterable<Type> types = const [BirthdaysSuccess, _$BirthdaysSuccess];
  @override
  final String wireName = 'BirthdaysSuccess';

  @override
  Iterable<Object> serialize(Serializers serializers, BirthdaysSuccess object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BirthdaysSuccessData)));
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
  BirthdaysSuccess deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BirthdaysSuccessBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BirthdaysSuccessData))
              as BirthdaysSuccessData);
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

class _$BirthdaysSuccess extends BirthdaysSuccess {
  @override
  final BirthdaysSuccessData data;
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

  factory _$BirthdaysSuccess(
          [void Function(BirthdaysSuccessBuilder) updates]) =>
      (new BirthdaysSuccessBuilder()..update(updates)).build();

  _$BirthdaysSuccess._(
      {this.data,
      this.success,
      this.host,
      this.version,
      this.returned,
      this.status})
      : super._();

  @override
  BirthdaysSuccess rebuild(void Function(BirthdaysSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BirthdaysSuccessBuilder toBuilder() =>
      new BirthdaysSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BirthdaysSuccess &&
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
    return (newBuiltValueToStringHelper('BirthdaysSuccess')
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status))
        .toString();
  }
}

class BirthdaysSuccessBuilder
    implements Builder<BirthdaysSuccess, BirthdaysSuccessBuilder> {
  _$BirthdaysSuccess _$v;

  BirthdaysSuccessDataBuilder _data;
  BirthdaysSuccessDataBuilder get data =>
      _$this._data ??= new BirthdaysSuccessDataBuilder();
  set data(BirthdaysSuccessDataBuilder data) => _$this._data = data;

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

  BirthdaysSuccessBuilder() {
    BirthdaysSuccess._initializeBuilder(this);
  }

  BirthdaysSuccessBuilder get _$this {
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
  void replace(BirthdaysSuccess other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BirthdaysSuccess;
  }

  @override
  void update(void Function(BirthdaysSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BirthdaysSuccess build() {
    _$BirthdaysSuccess _$result;
    try {
      _$result = _$v ??
          new _$BirthdaysSuccess._(
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
            'BirthdaysSuccess', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
