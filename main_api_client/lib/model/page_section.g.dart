// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'page_section.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PageSection> _$pageSectionSerializer = new _$PageSectionSerializer();

class _$PageSectionSerializer implements StructuredSerializer<PageSection> {
  @override
  final Iterable<Type> types = const [PageSection, _$PageSection];
  @override
  final String wireName = 'PageSection';

  @override
  Iterable<Object> serialize(Serializers serializers, PageSection object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PageSection deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PageSectionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PageSection extends PageSection {
  @override
  final String code;
  @override
  final String name;

  factory _$PageSection([void Function(PageSectionBuilder) updates]) =>
      (new PageSectionBuilder()..update(updates))._build();

  _$PageSection._({this.code, this.name}) : super._();

  @override
  PageSection rebuild(void Function(PageSectionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PageSectionBuilder toBuilder() => new PageSectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PageSection && code == other.code && name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PageSection')
          ..add('code', code)
          ..add('name', name))
        .toString();
  }
}

class PageSectionBuilder implements Builder<PageSection, PageSectionBuilder> {
  _$PageSection _$v;

  String _code;
  String get code => _$this._code;
  set code(String code) => _$this._code = code;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  PageSectionBuilder() {
    PageSection._initializeBuilder(this);
  }

  PageSectionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PageSection other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PageSection;
  }

  @override
  void update(void Function(PageSectionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  PageSection build() => _build();

  _$PageSection _build() {
    final _$result = _$v ?? new _$PageSection._(code: code, name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
