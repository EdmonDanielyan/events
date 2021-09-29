// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'get_reference_order_form.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GetReferenceOrderForm> _$getReferenceOrderFormSerializer =
    new _$GetReferenceOrderFormSerializer();

class _$GetReferenceOrderFormSerializer
    implements StructuredSerializer<GetReferenceOrderForm> {
  @override
  final Iterable<Type> types = const [
    GetReferenceOrderForm,
    _$GetReferenceOrderForm
  ];
  @override
  final String wireName = 'GetReferenceOrderForm';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GetReferenceOrderForm object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
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
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GetReferenceOrderForm deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GetReferenceOrderFormBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
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
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GetReferenceOrderForm extends GetReferenceOrderForm {
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
  @override
  final int status;

  factory _$GetReferenceOrderForm(
          [void Function(GetReferenceOrderFormBuilder) updates]) =>
      (new GetReferenceOrderFormBuilder()..update(updates)).build();

  _$GetReferenceOrderForm._(
      {this.data,
      this.success,
      this.host,
      this.version,
      this.returned,
      this.status})
      : super._();

  @override
  GetReferenceOrderForm rebuild(
          void Function(GetReferenceOrderFormBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetReferenceOrderFormBuilder toBuilder() =>
      new GetReferenceOrderFormBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetReferenceOrderForm &&
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
    return (newBuiltValueToStringHelper('GetReferenceOrderForm')
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status))
        .toString();
  }
}

class GetReferenceOrderFormBuilder
    implements Builder<GetReferenceOrderForm, GetReferenceOrderFormBuilder> {
  _$GetReferenceOrderForm _$v;

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

  int _status;
  int get status => _$this._status;
  set status(int status) => _$this._status = status;

  GetReferenceOrderFormBuilder() {
    GetReferenceOrderForm._initializeBuilder(this);
  }

  GetReferenceOrderFormBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
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
  void replace(GetReferenceOrderForm other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetReferenceOrderForm;
  }

  @override
  void update(void Function(GetReferenceOrderFormBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GetReferenceOrderForm build() {
    final _$result = _$v ??
        new _$GetReferenceOrderForm._(
            data: data,
            success: success,
            host: host,
            version: version,
            returned: returned,
            status: status);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
