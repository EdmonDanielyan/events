// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'event_property.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EventProperty> _$eventPropertySerializer =
    new _$EventPropertySerializer();

class _$EventPropertySerializer implements StructuredSerializer<EventProperty> {
  @override
  final Iterable<Type> types = const [EventProperty, _$EventProperty];
  @override
  final String wireName = 'EventProperty';

  @override
  Iterable<Object> serialize(Serializers serializers, EventProperty object,
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
    value = object.dateStart;
    if (value != null) {
      result
        ..add('date_start')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.dateFinish;
    if (value != null) {
      result
        ..add('date_finish')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.place;
    if (value != null) {
      result
        ..add('place')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
    value = object.detailPicture;
    if (value != null) {
      result
        ..add('detail_picture')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isMember;
    if (value != null) {
      result
        ..add('is_member')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  EventProperty deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EventPropertyBuilder();

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
        case 'date_start':
          result.dateStart = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'date_finish':
          result.dateFinish = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'place':
          result.place = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'view_count':
          result.viewCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'detail_text':
          result.detailText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'detail_picture':
          result.detailPicture = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'is_member':
          result.isMember = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$EventProperty extends EventProperty {
  @override
  final int id;
  @override
  final String title;
  @override
  final DateTime dateCreate;
  @override
  final DateTime dateStart;
  @override
  final DateTime dateFinish;
  @override
  final String place;
  @override
  final int viewCount;
  @override
  final String detailText;
  @override
  final String detailPicture;
  @override
  final bool isMember;

  factory _$EventProperty([void Function(EventPropertyBuilder) updates]) =>
      (new EventPropertyBuilder()..update(updates))._build();

  _$EventProperty._(
      {this.id,
      this.title,
      this.dateCreate,
      this.dateStart,
      this.dateFinish,
      this.place,
      this.viewCount,
      this.detailText,
      this.detailPicture,
      this.isMember})
      : super._();

  @override
  EventProperty rebuild(void Function(EventPropertyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventPropertyBuilder toBuilder() => new EventPropertyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventProperty &&
        id == other.id &&
        title == other.title &&
        dateCreate == other.dateCreate &&
        dateStart == other.dateStart &&
        dateFinish == other.dateFinish &&
        place == other.place &&
        viewCount == other.viewCount &&
        detailText == other.detailText &&
        detailPicture == other.detailPicture &&
        isMember == other.isMember;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc($jc(0, id.hashCode), title.hashCode),
                                    dateCreate.hashCode),
                                dateStart.hashCode),
                            dateFinish.hashCode),
                        place.hashCode),
                    viewCount.hashCode),
                detailText.hashCode),
            detailPicture.hashCode),
        isMember.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventProperty')
          ..add('id', id)
          ..add('title', title)
          ..add('dateCreate', dateCreate)
          ..add('dateStart', dateStart)
          ..add('dateFinish', dateFinish)
          ..add('place', place)
          ..add('viewCount', viewCount)
          ..add('detailText', detailText)
          ..add('detailPicture', detailPicture)
          ..add('isMember', isMember))
        .toString();
  }
}

class EventPropertyBuilder
    implements Builder<EventProperty, EventPropertyBuilder> {
  _$EventProperty _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  DateTime _dateCreate;
  DateTime get dateCreate => _$this._dateCreate;
  set dateCreate(DateTime dateCreate) => _$this._dateCreate = dateCreate;

  DateTime _dateStart;
  DateTime get dateStart => _$this._dateStart;
  set dateStart(DateTime dateStart) => _$this._dateStart = dateStart;

  DateTime _dateFinish;
  DateTime get dateFinish => _$this._dateFinish;
  set dateFinish(DateTime dateFinish) => _$this._dateFinish = dateFinish;

  String _place;
  String get place => _$this._place;
  set place(String place) => _$this._place = place;

  int _viewCount;
  int get viewCount => _$this._viewCount;
  set viewCount(int viewCount) => _$this._viewCount = viewCount;

  String _detailText;
  String get detailText => _$this._detailText;
  set detailText(String detailText) => _$this._detailText = detailText;

  String _detailPicture;
  String get detailPicture => _$this._detailPicture;
  set detailPicture(String detailPicture) =>
      _$this._detailPicture = detailPicture;

  bool _isMember;
  bool get isMember => _$this._isMember;
  set isMember(bool isMember) => _$this._isMember = isMember;

  EventPropertyBuilder() {
    EventProperty._initializeBuilder(this);
  }

  EventPropertyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _dateCreate = $v.dateCreate;
      _dateStart = $v.dateStart;
      _dateFinish = $v.dateFinish;
      _place = $v.place;
      _viewCount = $v.viewCount;
      _detailText = $v.detailText;
      _detailPicture = $v.detailPicture;
      _isMember = $v.isMember;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventProperty other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EventProperty;
  }

  @override
  void update(void Function(EventPropertyBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  EventProperty build() => _build();

  _$EventProperty _build() {
    final _$result = _$v ??
        new _$EventProperty._(
            id: id,
            title: title,
            dateCreate: dateCreate,
            dateStart: dateStart,
            dateFinish: dateFinish,
            place: place,
            viewCount: viewCount,
            detailText: detailText,
            detailPicture: detailPicture,
            isMember: isMember);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
