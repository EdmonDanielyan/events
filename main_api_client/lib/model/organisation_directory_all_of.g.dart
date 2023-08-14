// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'organisation_directory_all_of.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrganisationDirectoryAllOf> _$organisationDirectoryAllOfSerializer =
    new _$OrganisationDirectoryAllOfSerializer();

class _$OrganisationDirectoryAllOfSerializer
    implements StructuredSerializer<OrganisationDirectoryAllOf> {
  @override
  final Iterable<Type> types = const [
    OrganisationDirectoryAllOf,
    _$OrganisationDirectoryAllOf
  ];
  @override
  final String wireName = 'OrganisationDirectoryAllOf';

  @override
  Iterable<Object> serialize(
      Serializers serializers, OrganisationDirectoryAllOf object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.items;
    if (value != null) {
      result
        ..add('items')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(Organisation)])));
    }
    return result;
  }

  @override
  OrganisationDirectoryAllOf deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrganisationDirectoryAllOfBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'items':
          result.items.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Organisation)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$OrganisationDirectoryAllOf extends OrganisationDirectoryAllOf {
  @override
  final BuiltList<Organisation> items;

  factory _$OrganisationDirectoryAllOf(
          [void Function(OrganisationDirectoryAllOfBuilder) updates]) =>
      (new OrganisationDirectoryAllOfBuilder()..update(updates))._build();

  _$OrganisationDirectoryAllOf._({this.items}) : super._();

  @override
  OrganisationDirectoryAllOf rebuild(
          void Function(OrganisationDirectoryAllOfBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrganisationDirectoryAllOfBuilder toBuilder() =>
      new OrganisationDirectoryAllOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrganisationDirectoryAllOf && items == other.items;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrganisationDirectoryAllOf')
          ..add('items', items))
        .toString();
  }
}

class OrganisationDirectoryAllOfBuilder
    implements
        Builder<OrganisationDirectoryAllOf, OrganisationDirectoryAllOfBuilder> {
  _$OrganisationDirectoryAllOf _$v;

  ListBuilder<Organisation> _items;
  ListBuilder<Organisation> get items =>
      _$this._items ??= new ListBuilder<Organisation>();
  set items(ListBuilder<Organisation> items) => _$this._items = items;

  OrganisationDirectoryAllOfBuilder() {
    OrganisationDirectoryAllOf._initializeBuilder(this);
  }

  OrganisationDirectoryAllOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrganisationDirectoryAllOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrganisationDirectoryAllOf;
  }

  @override
  void update(void Function(OrganisationDirectoryAllOfBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  OrganisationDirectoryAllOf build() => _build();

  _$OrganisationDirectoryAllOf _build() {
    _$OrganisationDirectoryAllOf _$result;
    try {
      _$result =
          _$v ?? new _$OrganisationDirectoryAllOf._(items: _items?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'items';
        _items?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OrganisationDirectoryAllOf', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
