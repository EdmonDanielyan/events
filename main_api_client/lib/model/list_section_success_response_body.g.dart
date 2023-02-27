// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'list_section_success_response_body.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ListSectionSuccessResponseBody>
    _$listSectionSuccessResponseBodySerializer =
    new _$ListSectionSuccessResponseBodySerializer();

class _$ListSectionSuccessResponseBodySerializer
    implements StructuredSerializer<ListSectionSuccessResponseBody> {
  @override
  final Iterable<Type> types = const [
    ListSectionSuccessResponseBody,
    _$ListSectionSuccessResponseBody
  ];
  @override
  final String wireName = 'ListSectionSuccessResponseBody';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ListSectionSuccessResponseBody object,
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
            specifiedType: const FullType(ListSectionResponseData)));
    }
    return result;
  }

  @override
  ListSectionSuccessResponseBody deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ListSectionSuccessResponseBodyBuilder();

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
                  specifiedType: const FullType(ListSectionResponseData))
              as ListSectionResponseData);
          break;
      }
    }

    return result.build();
  }
}

class _$ListSectionSuccessResponseBody extends ListSectionSuccessResponseBody {
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
  final ListSectionResponseData data;

  factory _$ListSectionSuccessResponseBody(
          [void Function(ListSectionSuccessResponseBodyBuilder) updates]) =>
      (new ListSectionSuccessResponseBodyBuilder()..update(updates))._build();

  _$ListSectionSuccessResponseBody._(
      {this.success,
      this.host,
      this.version,
      this.returned,
      this.status,
      this.data})
      : super._();

  @override
  ListSectionSuccessResponseBody rebuild(
          void Function(ListSectionSuccessResponseBodyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListSectionSuccessResponseBodyBuilder toBuilder() =>
      new ListSectionSuccessResponseBodyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListSectionSuccessResponseBody &&
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
    return (newBuiltValueToStringHelper(r'ListSectionSuccessResponseBody')
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status)
          ..add('data', data))
        .toString();
  }
}

class ListSectionSuccessResponseBodyBuilder
    implements
        Builder<ListSectionSuccessResponseBody,
            ListSectionSuccessResponseBodyBuilder> {
  _$ListSectionSuccessResponseBody _$v;

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

  ListSectionResponseDataBuilder _data;
  ListSectionResponseDataBuilder get data =>
      _$this._data ??= new ListSectionResponseDataBuilder();
  set data(ListSectionResponseDataBuilder data) => _$this._data = data;

  ListSectionSuccessResponseBodyBuilder() {
    ListSectionSuccessResponseBody._initializeBuilder(this);
  }

  ListSectionSuccessResponseBodyBuilder get _$this {
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
  void replace(ListSectionSuccessResponseBody other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ListSectionSuccessResponseBody;
  }

  @override
  void update(void Function(ListSectionSuccessResponseBodyBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ListSectionSuccessResponseBody build() => _build();

  _$ListSectionSuccessResponseBody _build() {
    _$ListSectionSuccessResponseBody _$result;
    try {
      _$result = _$v ??
          new _$ListSectionSuccessResponseBody._(
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
            r'ListSectionSuccessResponseBody', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
