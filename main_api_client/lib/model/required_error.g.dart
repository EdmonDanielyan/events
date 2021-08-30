// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'required_error.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RequiredError> _$requiredErrorSerializer =
    new _$RequiredErrorSerializer();

class _$RequiredErrorSerializer implements StructuredSerializer<RequiredError> {
  @override
  final Iterable<Type> types = const [RequiredError, _$RequiredError];
  @override
  final String wireName = 'RequiredError';

  @override
  Iterable<Object> serialize(Serializers serializers, RequiredError object,
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
  RequiredError deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RequiredErrorBuilder();

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

class _$RequiredError extends RequiredError {
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

  factory _$RequiredError([void Function(RequiredErrorBuilder) updates]) =>
      (new RequiredErrorBuilder()..update(updates)).build();

  _$RequiredError._(
      {this.success,
      this.host,
      this.version,
      this.returned,
      this.type,
      this.instance})
      : super._();

  @override
  RequiredError rebuild(void Function(RequiredErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RequiredErrorBuilder toBuilder() => new RequiredErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RequiredError &&
        success == other.success &&
        host == other.host &&
        version == other.version &&
        returned == other.returned &&
        type == other.type &&
        instance == other.instance;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, success.hashCode), host.hashCode),
                    version.hashCode),
                returned.hashCode),
            type.hashCode),
        instance.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RequiredError')
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('type', type)
          ..add('instance', instance))
        .toString();
  }
}

class RequiredErrorBuilder
    implements Builder<RequiredError, RequiredErrorBuilder> {
  _$RequiredError _$v;

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

  RequiredErrorBuilder() {
    RequiredError._initializeBuilder(this);
  }

  RequiredErrorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
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
  void replace(RequiredError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RequiredError;
  }

  @override
  void update(void Function(RequiredErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RequiredError build() {
    final _$result = _$v ??
        new _$RequiredError._(
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
