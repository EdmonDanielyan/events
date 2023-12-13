// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organisation_directory.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OrganisationDirectory extends OrganisationDirectory {
  @override
  final DirectoryMetaSelect? select;
  @override
  final BuiltList<Organisation>? items;

  factory _$OrganisationDirectory(
          [void Function(OrganisationDirectoryBuilder)? updates]) =>
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
    implements
        Builder<OrganisationDirectory, OrganisationDirectoryBuilder>,
        DirectoryMetaBuilder,
        OrganisationDirectoryAllOfBuilder {
  _$OrganisationDirectory? _$v;

  DirectoryMetaSelectBuilder? _select;
  DirectoryMetaSelectBuilder get select =>
      _$this._select ??= new DirectoryMetaSelectBuilder();
  set select(covariant DirectoryMetaSelectBuilder? select) =>
      _$this._select = select;

  ListBuilder<Organisation>? _items;
  ListBuilder<Organisation> get items =>
      _$this._items ??= new ListBuilder<Organisation>();
  set items(covariant ListBuilder<Organisation>? items) =>
      _$this._items = items;

  OrganisationDirectoryBuilder() {
    OrganisationDirectory._defaults(this);
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
// ignore: override_on_non_overriding_method
  void replace(covariant OrganisationDirectory other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrganisationDirectory;
  }

  @override
  void update(void Function(OrganisationDirectoryBuilder)? updates) {
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
      late String _$failedField;
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
