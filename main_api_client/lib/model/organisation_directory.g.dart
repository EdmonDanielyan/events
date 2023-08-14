// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'organisation_directory.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrganisationDirectory> _$organisationDirectorySerializer =
    new _$OrganisationDirectorySerializer();

class _$OrganisationDirectorySerializer
    implements StructuredSerializer<OrganisationDirectory> {
  @override
  final Iterable<Type> types = const [
    OrganisationDirectory,
    _$OrganisationDirectory
  ];
  @override
  final String wireName = 'OrganisationDirectory';

  @override
  Iterable<Object> serialize(
      Serializers serializers, OrganisationDirectory object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.select;
    if (value != null) {
      result
        ..add('select')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DirectoryMetaSelect)));
    }
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
  OrganisationDirectory deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrganisationDirectoryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'select':
          result.select.replace(serializers.deserialize(value,
                  specifiedType: const FullType(DirectoryMetaSelect))
              as DirectoryMetaSelect);
          break;
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

class _$OrganisationDirectory extends OrganisationDirectory {
  @override
  final DirectoryMetaSelect select;
  @override
  final BuiltList<Organisation> items;

  factory _$OrganisationDirectory(
          [void Function(OrganisationDirectoryBuilder) updates]) =>
      (new OrganisationDirectoryBuilder()..update(updates))._build();

  _$OrganisationDirectory._({this.select, this.items}) : super._();

  @override
  OrganisationDirectory rebuild(
          void Function(OrganisationDirectoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrganisationDirectoryBuilder toBuilder() =>
      new OrganisationDirectoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrganisationDirectory &&
        select == other.select &&
        items == other.items;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, select.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrganisationDirectory')
          ..add('select', select)
          ..add('items', items))
        .toString();
  }
}

class OrganisationDirectoryBuilder
    implements Builder<OrganisationDirectory, OrganisationDirectoryBuilder> {
  _$OrganisationDirectory _$v;

  DirectoryMetaSelectBuilder _select;
  DirectoryMetaSelectBuilder get select =>
      _$this._select ??= new DirectoryMetaSelectBuilder();
  set select(DirectoryMetaSelectBuilder select) => _$this._select = select;

  ListBuilder<Organisation> _items;
  ListBuilder<Organisation> get items =>
      _$this._items ??= new ListBuilder<Organisation>();
  set items(ListBuilder<Organisation> items) => _$this._items = items;

  OrganisationDirectoryBuilder() {
    OrganisationDirectory._initializeBuilder(this);
  }

  OrganisationDirectoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _select = $v.select?.toBuilder();
      _items = $v.items?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrganisationDirectory other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrganisationDirectory;
  }

  @override
  void update(void Function(OrganisationDirectoryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  OrganisationDirectory build() => _build();

  _$OrganisationDirectory _build() {
    _$OrganisationDirectory _$result;
    try {
      _$result = _$v ??
          new _$OrganisationDirectory._(
              select: _select?.build(), items: _items?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'select';
        _select?.build();
        _$failedField = 'items';
        _items?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OrganisationDirectory', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
