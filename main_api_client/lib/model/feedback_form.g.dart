// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'feedback_form.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FeedbackForm> _$feedbackFormSerializer =
    new _$FeedbackFormSerializer();

class _$FeedbackFormSerializer implements StructuredSerializer<FeedbackForm> {
  @override
  final Iterable<Type> types = const [FeedbackForm, _$FeedbackForm];
  @override
  final String wireName = 'FeedbackForm';

  @override
  Iterable<Object> serialize(Serializers serializers, FeedbackForm object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  FeedbackForm deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FeedbackFormBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$FeedbackForm extends FeedbackForm {
  @override
  final String id;
  @override
  final String title;

  factory _$FeedbackForm([void Function(FeedbackFormBuilder) updates]) =>
      (new FeedbackFormBuilder()..update(updates)).build();

  _$FeedbackForm._({this.id, this.title}) : super._();

  @override
  FeedbackForm rebuild(void Function(FeedbackFormBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FeedbackFormBuilder toBuilder() => new FeedbackFormBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FeedbackForm && id == other.id && title == other.title;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), title.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FeedbackForm')
          ..add('id', id)
          ..add('title', title))
        .toString();
  }
}

class FeedbackFormBuilder
    implements Builder<FeedbackForm, FeedbackFormBuilder> {
  _$FeedbackForm _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  FeedbackFormBuilder() {
    FeedbackForm._initializeBuilder(this);
  }

  FeedbackFormBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FeedbackForm other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FeedbackForm;
  }

  @override
  void update(void Function(FeedbackFormBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FeedbackForm build() {
    final _$result = _$v ?? new _$FeedbackForm._(id: id, title: title);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
