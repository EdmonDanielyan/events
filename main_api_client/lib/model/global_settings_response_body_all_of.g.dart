// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'global_settings_response_body_all_of.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GlobalSettingsResponseBodyAllOf>
    _$globalSettingsResponseBodyAllOfSerializer =
    new _$GlobalSettingsResponseBodyAllOfSerializer();

class _$GlobalSettingsResponseBodyAllOfSerializer
    implements StructuredSerializer<GlobalSettingsResponseBodyAllOf> {
  @override
  final Iterable<Type> types = const [
    GlobalSettingsResponseBodyAllOf,
    _$GlobalSettingsResponseBodyAllOf
  ];
  @override
  final String wireName = 'GlobalSettingsResponseBodyAllOf';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GlobalSettingsResponseBodyAllOf object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GlobalSettings)));
    }
    return result;
  }

  @override
  GlobalSettingsResponseBodyAllOf deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GlobalSettingsResponseBodyAllOfBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(GlobalSettings)) as GlobalSettings);
          break;
      }
    }

    return result.build();
  }
}

class _$GlobalSettingsResponseBodyAllOf
    extends GlobalSettingsResponseBodyAllOf {
  @override
  final GlobalSettings data;

  factory _$GlobalSettingsResponseBodyAllOf(
          [void Function(GlobalSettingsResponseBodyAllOfBuilder) updates]) =>
      (new GlobalSettingsResponseBodyAllOfBuilder()..update(updates))._build();

  _$GlobalSettingsResponseBodyAllOf._({this.data}) : super._();

  @override
  GlobalSettingsResponseBodyAllOf rebuild(
          void Function(GlobalSettingsResponseBodyAllOfBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GlobalSettingsResponseBodyAllOfBuilder toBuilder() =>
      new GlobalSettingsResponseBodyAllOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GlobalSettingsResponseBodyAllOf && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GlobalSettingsResponseBodyAllOf')
          ..add('data', data))
        .toString();
  }
}

class GlobalSettingsResponseBodyAllOfBuilder
    implements
        Builder<GlobalSettingsResponseBodyAllOf,
            GlobalSettingsResponseBodyAllOfBuilder> {
  _$GlobalSettingsResponseBodyAllOf _$v;

  GlobalSettingsBuilder _data;
  GlobalSettingsBuilder get data =>
      _$this._data ??= new GlobalSettingsBuilder();
  set data(GlobalSettingsBuilder data) => _$this._data = data;

  GlobalSettingsResponseBodyAllOfBuilder() {
    GlobalSettingsResponseBodyAllOf._initializeBuilder(this);
  }

  GlobalSettingsResponseBodyAllOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GlobalSettingsResponseBodyAllOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GlobalSettingsResponseBodyAllOf;
  }

  @override
  void update(void Function(GlobalSettingsResponseBodyAllOfBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  GlobalSettingsResponseBodyAllOf build() => _build();

  _$GlobalSettingsResponseBodyAllOf _build() {
    _$GlobalSettingsResponseBodyAllOf _$result;
    try {
      _$result =
          _$v ?? new _$GlobalSettingsResponseBodyAllOf._(data: _data?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GlobalSettingsResponseBodyAllOf', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
