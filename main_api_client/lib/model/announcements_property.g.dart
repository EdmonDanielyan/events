// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'announcements_property.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AnnouncementsProperty> _$announcementsPropertySerializer =
    new _$AnnouncementsPropertySerializer();

class _$AnnouncementsPropertySerializer
    implements StructuredSerializer<AnnouncementsProperty> {
  @override
  final Iterable<Type> types = const [
    AnnouncementsProperty,
    _$AnnouncementsProperty
  ];
  @override
  final String wireName = 'AnnouncementsProperty';

  @override
  Iterable<Object> serialize(
      Serializers serializers, AnnouncementsProperty object,
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
    value = object.viewCount;
    if (value != null) {
      result
        ..add('view_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  AnnouncementsProperty deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AnnouncementsPropertyBuilder();

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
        case 'view_count':
          result.viewCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$AnnouncementsProperty extends AnnouncementsProperty {
  @override
  final int id;
  @override
  final String title;
  @override
  final DateTime dateCreate;
  @override
  final int viewCount;

  factory _$AnnouncementsProperty(
          [void Function(AnnouncementsPropertyBuilder) updates]) =>
      (new AnnouncementsPropertyBuilder()..update(updates))._build();

  _$AnnouncementsProperty._(
      {this.id, this.title, this.dateCreate, this.viewCount})
      : super._();

  @override
  AnnouncementsProperty rebuild(
          void Function(AnnouncementsPropertyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnnouncementsPropertyBuilder toBuilder() =>
      new AnnouncementsPropertyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnnouncementsProperty &&
        id == other.id &&
        title == other.title &&
        dateCreate == other.dateCreate &&
        viewCount == other.viewCount;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), title.hashCode), dateCreate.hashCode),
        viewCount.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnnouncementsProperty')
          ..add('id', id)
          ..add('title', title)
          ..add('dateCreate', dateCreate)
          ..add('viewCount', viewCount))
        .toString();
  }
}

class AnnouncementsPropertyBuilder
    implements Builder<AnnouncementsProperty, AnnouncementsPropertyBuilder> {
  _$AnnouncementsProperty _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  DateTime _dateCreate;
  DateTime get dateCreate => _$this._dateCreate;
  set dateCreate(DateTime dateCreate) => _$this._dateCreate = dateCreate;

  int _viewCount;
  int get viewCount => _$this._viewCount;
  set viewCount(int viewCount) => _$this._viewCount = viewCount;

  AnnouncementsPropertyBuilder() {
    AnnouncementsProperty._initializeBuilder(this);
  }

  AnnouncementsPropertyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _dateCreate = $v.dateCreate;
      _viewCount = $v.viewCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnnouncementsProperty other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AnnouncementsProperty;
  }

  @override
  void update(void Function(AnnouncementsPropertyBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  AnnouncementsProperty build() => _build();

  _$AnnouncementsProperty _build() {
    final _$result = _$v ??
        new _$AnnouncementsProperty._(
            id: id, title: title, dateCreate: dateCreate, viewCount: viewCount);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
