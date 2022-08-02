// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'announcement_property.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AnnouncementProperty> _$announcementPropertySerializer =
    new _$AnnouncementPropertySerializer();

class _$AnnouncementPropertySerializer
    implements StructuredSerializer<AnnouncementProperty> {
  @override
  final Iterable<Type> types = const [
    AnnouncementProperty,
    _$AnnouncementProperty
  ];
  @override
  final String wireName = 'AnnouncementProperty';

  @override
  Iterable<Object> serialize(
      Serializers serializers, AnnouncementProperty object,
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
    value = object.detailText;
    if (value != null) {
      result
        ..add('detail_text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AnnouncementProperty deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AnnouncementPropertyBuilder();

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
        case 'detail_text':
          result.detailText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AnnouncementProperty extends AnnouncementProperty {
  @override
  final int id;
  @override
  final String title;
  @override
  final DateTime dateCreate;
  @override
  final int viewCount;
  @override
  final String detailText;

  factory _$AnnouncementProperty(
          [void Function(AnnouncementPropertyBuilder) updates]) =>
      (new AnnouncementPropertyBuilder()..update(updates))._build();

  _$AnnouncementProperty._(
      {this.id, this.title, this.dateCreate, this.viewCount, this.detailText})
      : super._();

  @override
  AnnouncementProperty rebuild(
          void Function(AnnouncementPropertyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnnouncementPropertyBuilder toBuilder() =>
      new AnnouncementPropertyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnnouncementProperty &&
        id == other.id &&
        title == other.title &&
        dateCreate == other.dateCreate &&
        viewCount == other.viewCount &&
        detailText == other.detailText;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), title.hashCode), dateCreate.hashCode),
            viewCount.hashCode),
        detailText.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnnouncementProperty')
          ..add('id', id)
          ..add('title', title)
          ..add('dateCreate', dateCreate)
          ..add('viewCount', viewCount)
          ..add('detailText', detailText))
        .toString();
  }
}

class AnnouncementPropertyBuilder
    implements Builder<AnnouncementProperty, AnnouncementPropertyBuilder> {
  _$AnnouncementProperty _$v;

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

  String _detailText;
  String get detailText => _$this._detailText;
  set detailText(String detailText) => _$this._detailText = detailText;

  AnnouncementPropertyBuilder() {
    AnnouncementProperty._initializeBuilder(this);
  }

  AnnouncementPropertyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _dateCreate = $v.dateCreate;
      _viewCount = $v.viewCount;
      _detailText = $v.detailText;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnnouncementProperty other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AnnouncementProperty;
  }

  @override
  void update(void Function(AnnouncementPropertyBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  AnnouncementProperty build() => _build();

  _$AnnouncementProperty _build() {
    final _$result = _$v ??
        new _$AnnouncementProperty._(
            id: id,
            title: title,
            dateCreate: dateCreate,
            viewCount: viewCount,
            detailText: detailText);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
