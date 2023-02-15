// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'reference_auto_fill.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReferenceAutoFill> _$referenceAutoFillSerializer =
    new _$ReferenceAutoFillSerializer();

class _$ReferenceAutoFillSerializer
    implements StructuredSerializer<ReferenceAutoFill> {
  @override
  final Iterable<Type> types = const [ReferenceAutoFill, _$ReferenceAutoFill];
  @override
  final String wireName = 'ReferenceAutoFill';

  @override
  Iterable<Object> serialize(Serializers serializers, ReferenceAutoFill object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(AutoFillForm)));
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
  ReferenceAutoFill deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReferenceAutoFillBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(AutoFillForm)) as AutoFillForm);
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

class _$ReferenceAutoFill extends ReferenceAutoFill {
  @override
  final AutoFillForm data;
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

  factory _$ReferenceAutoFill(
          [void Function(ReferenceAutoFillBuilder) updates]) =>
      (new ReferenceAutoFillBuilder()..update(updates))._build();

  _$ReferenceAutoFill._(
      {this.data,
      this.success,
      this.host,
      this.version,
      this.returned,
      this.status})
      : super._();

  @override
  ReferenceAutoFill rebuild(void Function(ReferenceAutoFillBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReferenceAutoFillBuilder toBuilder() =>
      new ReferenceAutoFillBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReferenceAutoFill &&
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
    return (newBuiltValueToStringHelper(r'ReferenceAutoFill')
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status))
        .toString();
  }
}

class ReferenceAutoFillBuilder
    implements Builder<ReferenceAutoFill, ReferenceAutoFillBuilder> {
  _$ReferenceAutoFill _$v;

  AutoFillFormBuilder _data;
  AutoFillFormBuilder get data => _$this._data ??= new AutoFillFormBuilder();
  set data(AutoFillFormBuilder data) => _$this._data = data;

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

  ReferenceAutoFillBuilder() {
    ReferenceAutoFill._initializeBuilder(this);
  }

  ReferenceAutoFillBuilder get _$this {
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
  void replace(ReferenceAutoFill other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReferenceAutoFill;
  }

  @override
  void update(void Function(ReferenceAutoFillBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ReferenceAutoFill build() => _build();

  _$ReferenceAutoFill _build() {
    _$ReferenceAutoFill _$result;
    try {
      _$result = _$v ??
          new _$ReferenceAutoFill._(
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
            r'ReferenceAutoFill', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
