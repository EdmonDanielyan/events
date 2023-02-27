// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'single_section_success_response_body.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SingleSectionSuccessResponseBody>
    _$singleSectionSuccessResponseBodySerializer =
    new _$SingleSectionSuccessResponseBodySerializer();

class _$SingleSectionSuccessResponseBodySerializer
    implements StructuredSerializer<SingleSectionSuccessResponseBody> {
  @override
  final Iterable<Type> types = const [
    SingleSectionSuccessResponseBody,
    _$SingleSectionSuccessResponseBody
  ];
  @override
  final String wireName = 'SingleSectionSuccessResponseBody';

  @override
  Iterable<Object> serialize(
      Serializers serializers, SingleSectionSuccessResponseBody object,
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
            specifiedType: const FullType(SingleSectionResponseData)));
    }
    return result;
  }

  @override
  SingleSectionSuccessResponseBody deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SingleSectionSuccessResponseBodyBuilder();

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
                  specifiedType: const FullType(SingleSectionResponseData))
              as SingleSectionResponseData);
          break;
      }
    }

    return result.build();
  }
}

class _$SingleSectionSuccessResponseBody
    extends SingleSectionSuccessResponseBody {
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
  final SingleSectionResponseData data;

  factory _$SingleSectionSuccessResponseBody(
          [void Function(SingleSectionSuccessResponseBodyBuilder) updates]) =>
      (new SingleSectionSuccessResponseBodyBuilder()..update(updates))._build();

  _$SingleSectionSuccessResponseBody._(
      {this.success,
      this.host,
      this.version,
      this.returned,
      this.status,
      this.data})
      : super._();

  @override
  SingleSectionSuccessResponseBody rebuild(
          void Function(SingleSectionSuccessResponseBodyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SingleSectionSuccessResponseBodyBuilder toBuilder() =>
      new SingleSectionSuccessResponseBodyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SingleSectionSuccessResponseBody &&
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
    return (newBuiltValueToStringHelper(r'SingleSectionSuccessResponseBody')
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status)
          ..add('data', data))
        .toString();
  }
}

class SingleSectionSuccessResponseBodyBuilder
    implements
        Builder<SingleSectionSuccessResponseBody,
            SingleSectionSuccessResponseBodyBuilder> {
  _$SingleSectionSuccessResponseBody _$v;

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

  SingleSectionResponseDataBuilder _data;
  SingleSectionResponseDataBuilder get data =>
      _$this._data ??= new SingleSectionResponseDataBuilder();
  set data(SingleSectionResponseDataBuilder data) => _$this._data = data;

  SingleSectionSuccessResponseBodyBuilder() {
    SingleSectionSuccessResponseBody._initializeBuilder(this);
  }

  SingleSectionSuccessResponseBodyBuilder get _$this {
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
  void replace(SingleSectionSuccessResponseBody other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SingleSectionSuccessResponseBody;
  }

  @override
  void update(void Function(SingleSectionSuccessResponseBodyBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  SingleSectionSuccessResponseBody build() => _build();

  _$SingleSectionSuccessResponseBody _build() {
    _$SingleSectionSuccessResponseBody _$result;
    try {
      _$result = _$v ??
          new _$SingleSectionSuccessResponseBody._(
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
            r'SingleSectionSuccessResponseBody', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
