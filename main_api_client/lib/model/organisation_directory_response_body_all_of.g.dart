// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'organisation_directory_response_body_all_of.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrganisationDirectoryResponseBodyAllOf>
    _$organisationDirectoryResponseBodyAllOfSerializer =
    new _$OrganisationDirectoryResponseBodyAllOfSerializer();

class _$OrganisationDirectoryResponseBodyAllOfSerializer
    implements StructuredSerializer<OrganisationDirectoryResponseBodyAllOf> {
  @override
  final Iterable<Type> types = const [
    OrganisationDirectoryResponseBodyAllOf,
    _$OrganisationDirectoryResponseBodyAllOf
  ];
  @override
  final String wireName = 'OrganisationDirectoryResponseBodyAllOf';

  @override
  Iterable<Object> serialize(
      Serializers serializers, OrganisationDirectoryResponseBodyAllOf object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(OrganisationDirectory)));
    }
    return result;
  }

  @override
  OrganisationDirectoryResponseBodyAllOf deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrganisationDirectoryResponseBodyAllOfBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(OrganisationDirectory))
              as OrganisationDirectory);
          break;
      }
    }

    return result.build();
  }
}

class _$OrganisationDirectoryResponseBodyAllOf
    extends OrganisationDirectoryResponseBodyAllOf {
  @override
  final OrganisationDirectory data;

  factory _$OrganisationDirectoryResponseBodyAllOf(
          [void Function(OrganisationDirectoryResponseBodyAllOfBuilder)
              updates]) =>
      (new OrganisationDirectoryResponseBodyAllOfBuilder()..update(updates))
          ._build();

  _$OrganisationDirectoryResponseBodyAllOf._({this.data}) : super._();

  @override
  OrganisationDirectoryResponseBodyAllOf rebuild(
          void Function(OrganisationDirectoryResponseBodyAllOfBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrganisationDirectoryResponseBodyAllOfBuilder toBuilder() =>
      new OrganisationDirectoryResponseBodyAllOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrganisationDirectoryResponseBodyAllOf &&
        data == other.data;
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
    return (newBuiltValueToStringHelper(
            r'OrganisationDirectoryResponseBodyAllOf')
          ..add('data', data))
        .toString();
  }
}

class OrganisationDirectoryResponseBodyAllOfBuilder
    implements
        Builder<OrganisationDirectoryResponseBodyAllOf,
            OrganisationDirectoryResponseBodyAllOfBuilder> {
  _$OrganisationDirectoryResponseBodyAllOf _$v;

  OrganisationDirectoryBuilder _data;
  OrganisationDirectoryBuilder get data =>
      _$this._data ??= new OrganisationDirectoryBuilder();
  set data(OrganisationDirectoryBuilder data) => _$this._data = data;

  OrganisationDirectoryResponseBodyAllOfBuilder() {
    OrganisationDirectoryResponseBodyAllOf._initializeBuilder(this);
  }

  OrganisationDirectoryResponseBodyAllOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrganisationDirectoryResponseBodyAllOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrganisationDirectoryResponseBodyAllOf;
  }

  @override
  void update(
      void Function(OrganisationDirectoryResponseBodyAllOfBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  OrganisationDirectoryResponseBodyAllOf build() => _build();

  _$OrganisationDirectoryResponseBodyAllOf _build() {
    _$OrganisationDirectoryResponseBodyAllOf _$result;
    try {
      _$result = _$v ??
          new _$OrganisationDirectoryResponseBodyAllOf._(data: _data?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OrganisationDirectoryResponseBodyAllOf',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
