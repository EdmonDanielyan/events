// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'publications_property.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PublicationsProperty> _$publicationsPropertySerializer =
    new _$PublicationsPropertySerializer();

class _$PublicationsPropertySerializer
    implements StructuredSerializer<PublicationsProperty> {
  @override
  final Iterable<Type> types = const [
    PublicationsProperty,
    _$PublicationsProperty
  ];
  @override
  final String wireName = 'PublicationsProperty';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PublicationsProperty object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateCreate;
    if (value != null) {
      result
        ..add('date_create')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.votes;
    if (value != null) {
      result
        ..add('votes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  PublicationsProperty deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PublicationsPropertyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date_create':
          result.dateCreate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'votes':
          result.votes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$PublicationsProperty extends PublicationsProperty {
  @override
  final int id;
  @override
  final String title;
  @override
  final DateTime dateCreate;
  @override
  final int votes;

  factory _$PublicationsProperty(
          [void Function(PublicationsPropertyBuilder) updates]) =>
      (new PublicationsPropertyBuilder()..update(updates))._build();

  _$PublicationsProperty._({this.id, this.title, this.dateCreate, this.votes})
      : super._();

  @override
  PublicationsProperty rebuild(
          void Function(PublicationsPropertyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PublicationsPropertyBuilder toBuilder() =>
      new PublicationsPropertyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PublicationsProperty &&
        id == other.id &&
        title == other.title &&
        dateCreate == other.dateCreate &&
        votes == other.votes;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), title.hashCode), dateCreate.hashCode),
        votes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PublicationsProperty')
          ..add('id', id)
          ..add('title', title)
          ..add('dateCreate', dateCreate)
          ..add('votes', votes))
        .toString();
  }
}

class PublicationsPropertyBuilder
    implements Builder<PublicationsProperty, PublicationsPropertyBuilder> {
  _$PublicationsProperty _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  DateTime _dateCreate;
  DateTime get dateCreate => _$this._dateCreate;
  set dateCreate(DateTime dateCreate) => _$this._dateCreate = dateCreate;

  int _votes;
  int get votes => _$this._votes;
  set votes(int votes) => _$this._votes = votes;

  PublicationsPropertyBuilder() {
    PublicationsProperty._initializeBuilder(this);
  }

  PublicationsPropertyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _dateCreate = $v.dateCreate;
      _votes = $v.votes;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PublicationsProperty other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PublicationsProperty;
  }

  @override
  void update(void Function(PublicationsPropertyBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  PublicationsProperty build() => _build();

  _$PublicationsProperty _build() {
    final _$result = _$v ??
        new _$PublicationsProperty._(
            id: id, title: title, dateCreate: dateCreate, votes: votes);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
