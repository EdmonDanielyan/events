// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organisation_directory_all_of.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class OrganisationDirectoryAllOfBuilder {
  void replace(OrganisationDirectoryAllOf other);
  void update(void Function(OrganisationDirectoryAllOfBuilder) updates);
  ListBuilder<Organisation> get items;
  set items(ListBuilder<Organisation>? items);
}

class _$$OrganisationDirectoryAllOf extends $OrganisationDirectoryAllOf {
  @override
  final BuiltList<Organisation>? items;

  factory _$$OrganisationDirectoryAllOf(
          [void Function($OrganisationDirectoryAllOfBuilder)? updates]) =>
      (new $OrganisationDirectoryAllOfBuilder()..update(updates))._build();

  _$$OrganisationDirectoryAllOf._({this.items}) : super._();

  @override
  $OrganisationDirectoryAllOf rebuild(
          void Function($OrganisationDirectoryAllOfBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $OrganisationDirectoryAllOfBuilder toBuilder() =>
      new $OrganisationDirectoryAllOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $OrganisationDirectoryAllOf && items == other.items;
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
    return (newBuiltValueToStringHelper(r'$OrganisationDirectoryAllOf')
          ..add('items', items))
        .toString();
  }
}

class $OrganisationDirectoryAllOfBuilder
    implements
        Builder<$OrganisationDirectoryAllOf,
            $OrganisationDirectoryAllOfBuilder>,
        OrganisationDirectoryAllOfBuilder {
  _$$OrganisationDirectoryAllOf? _$v;

  ListBuilder<Organisation>? _items;
  ListBuilder<Organisation> get items =>
      _$this._items ??= new ListBuilder<Organisation>();
  set items(covariant ListBuilder<Organisation>? items) =>
      _$this._items = items;

  $OrganisationDirectoryAllOfBuilder() {
    $OrganisationDirectoryAllOf._defaults(this);
  }

  $OrganisationDirectoryAllOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant $OrganisationDirectoryAllOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$$OrganisationDirectoryAllOf;
  }

  @override
  void update(void Function($OrganisationDirectoryAllOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $OrganisationDirectoryAllOf build() => _build();

  _$$OrganisationDirectoryAllOf _build() {
    _$$OrganisationDirectoryAllOf _$result;
    try {
      _$result =
          _$v ?? new _$$OrganisationDirectoryAllOf._(items: _items?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        _items?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'$OrganisationDirectoryAllOf', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
