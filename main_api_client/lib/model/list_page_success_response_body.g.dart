// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'list_page_success_response_body.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ListPageSuccessResponseBody>
    _$listPageSuccessResponseBodySerializer =
    new _$ListPageSuccessResponseBodySerializer();

class _$ListPageSuccessResponseBodySerializer
    implements StructuredSerializer<ListPageSuccessResponseBody> {
  @override
  final Iterable<Type> types = const [
    ListPageSuccessResponseBody,
    _$ListPageSuccessResponseBody
  ];
  @override
  final String wireName = 'ListPageSuccessResponseBody';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ListPageSuccessResponseBody object,
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
            specifiedType: const FullType(ListPageResponseData)));
    }
    return result;
  }

  @override
  ListPageSuccessResponseBody deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ListPageSuccessResponseBodyBuilder();

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
                  specifiedType: const FullType(ListPageResponseData))
              as ListPageResponseData);
          break;
      }
    }

    return result.build();
  }
}

class _$ListPageSuccessResponseBody extends ListPageSuccessResponseBody {
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
  final ListPageResponseData data;

  factory _$ListPageSuccessResponseBody(
          [void Function(ListPageSuccessResponseBodyBuilder) updates]) =>
      (new ListPageSuccessResponseBodyBuilder()..update(updates))._build();

  _$ListPageSuccessResponseBody._(
      {this.success,
      this.host,
      this.version,
      this.returned,
      this.status,
      this.data})
      : super._();

  @override
  ListPageSuccessResponseBody rebuild(
          void Function(ListPageSuccessResponseBodyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListPageSuccessResponseBodyBuilder toBuilder() =>
      new ListPageSuccessResponseBodyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListPageSuccessResponseBody &&
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
    return (newBuiltValueToStringHelper(r'ListPageSuccessResponseBody')
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status)
          ..add('data', data))
        .toString();
  }
}

class ListPageSuccessResponseBodyBuilder
    implements
        Builder<ListPageSuccessResponseBody,
            ListPageSuccessResponseBodyBuilder> {
  _$ListPageSuccessResponseBody _$v;

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

  ListPageResponseDataBuilder _data;
  ListPageResponseDataBuilder get data =>
      _$this._data ??= new ListPageResponseDataBuilder();
  set data(ListPageResponseDataBuilder data) => _$this._data = data;

  ListPageSuccessResponseBodyBuilder() {
    ListPageSuccessResponseBody._initializeBuilder(this);
  }

  ListPageSuccessResponseBodyBuilder get _$this {
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
  void replace(ListPageSuccessResponseBody other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ListPageSuccessResponseBody;
  }

  @override
  void update(void Function(ListPageSuccessResponseBodyBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ListPageSuccessResponseBody build() => _build();

  _$ListPageSuccessResponseBody _build() {
    _$ListPageSuccessResponseBody _$result;
    try {
      _$result = _$v ??
          new _$ListPageSuccessResponseBody._(
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
            r'ListPageSuccessResponseBody', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
