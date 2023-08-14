// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'organisation.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Organisation> _$organisationSerializer =
    new _$OrganisationSerializer();

class _$OrganisationSerializer implements StructuredSerializer<Organisation> {
  @override
  final Iterable<Type> types = const [Organisation, _$Organisation];
  @override
  final String wireName = 'Organisation';

  @override
  Iterable<Object> serialize(Serializers serializers, Organisation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sort;
    if (value != null) {
      result
        ..add('sort')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.inn;
    if (value != null) {
      result
        ..add('inn')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.zup;
    if (value != null) {
      result
        ..add('zup')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.link;
    if (value != null) {
      result
        ..add('link')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.hidden;
    if (value != null) {
      result
        ..add('hidden')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.dativeFio;
    if (value != null) {
      result
        ..add('dativeFio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dativePosition;
    if (value != null) {
      result
        ..add('dativePosition')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Organisation deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrganisationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'sort':
          result.sort = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'inn':
          result.inn = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'zup':
          result.zup = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'link':
          result.link = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'hidden':
          result.hidden = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'dativeFio':
          result.dativeFio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'dativePosition':
          result.dativePosition = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Organisation extends Organisation {
  @override
  final num id;
  @override
  final String name;
  @override
  final String code;
  @override
  final String sort;
  @override
  final String inn;
  @override
  final String zup;
  @override
  final String link;
  @override
  final bool hidden;
  @override
  final String dativeFio;
  @override
  final String dativePosition;

  factory _$Organisation([void Function(OrganisationBuilder) updates]) =>
      (new OrganisationBuilder()..update(updates))._build();

  _$Organisation._(
      {this.id,
      this.name,
      this.code,
      this.sort,
      this.inn,
      this.zup,
      this.link,
      this.hidden,
      this.dativeFio,
      this.dativePosition})
      : super._();

  @override
  Organisation rebuild(void Function(OrganisationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrganisationBuilder toBuilder() => new OrganisationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Organisation &&
        id == other.id &&
        name == other.name &&
        code == other.code &&
        sort == other.sort &&
        inn == other.inn &&
        zup == other.zup &&
        link == other.link &&
        hidden == other.hidden &&
        dativeFio == other.dativeFio &&
        dativePosition == other.dativePosition;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, sort.hashCode);
    _$hash = $jc(_$hash, inn.hashCode);
    _$hash = $jc(_$hash, zup.hashCode);
    _$hash = $jc(_$hash, link.hashCode);
    _$hash = $jc(_$hash, hidden.hashCode);
    _$hash = $jc(_$hash, dativeFio.hashCode);
    _$hash = $jc(_$hash, dativePosition.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Organisation')
          ..add('id', id)
          ..add('name', name)
          ..add('code', code)
          ..add('sort', sort)
          ..add('inn', inn)
          ..add('zup', zup)
          ..add('link', link)
          ..add('hidden', hidden)
          ..add('dativeFio', dativeFio)
          ..add('dativePosition', dativePosition))
        .toString();
  }
}

class OrganisationBuilder
    implements Builder<Organisation, OrganisationBuilder> {
  _$Organisation _$v;

  num _id;
  num get id => _$this._id;
  set id(num id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _code;
  String get code => _$this._code;
  set code(String code) => _$this._code = code;

  String _sort;
  String get sort => _$this._sort;
  set sort(String sort) => _$this._sort = sort;

  String _inn;
  String get inn => _$this._inn;
  set inn(String inn) => _$this._inn = inn;

  String _zup;
  String get zup => _$this._zup;
  set zup(String zup) => _$this._zup = zup;

  String _link;
  String get link => _$this._link;
  set link(String link) => _$this._link = link;

  bool _hidden;
  bool get hidden => _$this._hidden;
  set hidden(bool hidden) => _$this._hidden = hidden;

  String _dativeFio;
  String get dativeFio => _$this._dativeFio;
  set dativeFio(String dativeFio) => _$this._dativeFio = dativeFio;

  String _dativePosition;
  String get dativePosition => _$this._dativePosition;
  set dativePosition(String dativePosition) =>
      _$this._dativePosition = dativePosition;

  OrganisationBuilder() {
    Organisation._initializeBuilder(this);
  }

  OrganisationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _code = $v.code;
      _sort = $v.sort;
      _inn = $v.inn;
      _zup = $v.zup;
      _link = $v.link;
      _hidden = $v.hidden;
      _dativeFio = $v.dativeFio;
      _dativePosition = $v.dativePosition;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Organisation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Organisation;
  }

  @override
  void update(void Function(OrganisationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  Organisation build() => _build();

  _$Organisation _build() {
    final _$result = _$v ??
        new _$Organisation._(
            id: id,
            name: name,
            code: code,
            sort: sort,
            inn: inn,
            zup: zup,
            link: link,
            hidden: hidden,
            dativeFio: dativeFio,
            dativePosition: dativePosition);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
