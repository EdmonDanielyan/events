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
      (new FeedbackFormBuilder()..update(updates))._build();

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
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FeedbackForm')
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
  FeedbackForm build() => _build();

  _$FeedbackForm _build() {
    final _$result = _$v ?? new _$FeedbackForm._(id: id, title: title);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
