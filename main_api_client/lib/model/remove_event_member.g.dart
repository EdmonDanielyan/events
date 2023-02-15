// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'remove_event_member.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RemoveEventMember> _$removeEventMemberSerializer =
    new _$RemoveEventMemberSerializer();

class _$RemoveEventMemberSerializer
    implements StructuredSerializer<RemoveEventMember> {
  @override
  final Iterable<Type> types = const [RemoveEventMember, _$RemoveEventMember];
  @override
  final String wireName = 'RemoveEventMember';

  @override
  Iterable<Object> serialize(Serializers serializers, RemoveEventMember object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  RemoveEventMember deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RemoveEventMemberBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'data':
          result.data = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$RemoveEventMember extends RemoveEventMember {
  @override
  final String data;
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

  factory _$RemoveEventMember(
          [void Function(RemoveEventMemberBuilder) updates]) =>
      (new RemoveEventMemberBuilder()..update(updates))._build();

  _$RemoveEventMember._(
      {this.data,
      this.success,
      this.host,
      this.version,
      this.returned,
      this.status})
      : super._();

  @override
  RemoveEventMember rebuild(void Function(RemoveEventMemberBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoveEventMemberBuilder toBuilder() =>
      new RemoveEventMemberBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoveEventMember &&
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
    return (newBuiltValueToStringHelper(r'RemoveEventMember')
          ..add('data', data)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('status', status))
        .toString();
  }
}

class RemoveEventMemberBuilder
    implements Builder<RemoveEventMember, RemoveEventMemberBuilder> {
  _$RemoveEventMember _$v;

  String _data;
  String get data => _$this._data;
  set data(String data) => _$this._data = data;

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

  RemoveEventMemberBuilder() {
    RemoveEventMember._initializeBuilder(this);
  }

  RemoveEventMemberBuilder get _$this {
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
  void replace(RemoveEventMember other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RemoveEventMember;
  }

  @override
  void update(void Function(RemoveEventMemberBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  RemoveEventMember build() => _build();

  _$RemoveEventMember _build() {
    final _$result = _$v ??
        new _$RemoveEventMember._(
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

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
