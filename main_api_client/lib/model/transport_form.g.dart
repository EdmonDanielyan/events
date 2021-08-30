// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'transport_form.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TransportForm> _$transportFormSerializer =
    new _$TransportFormSerializer();

class _$TransportFormSerializer implements StructuredSerializer<TransportForm> {
  @override
  final Iterable<Type> types = const [TransportForm, _$TransportForm];
  @override
  final String wireName = 'TransportForm';

  @override
  Iterable<Object> serialize(Serializers serializers, TransportForm object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.ID;
    if (value != null) {
      result
        ..add('ID')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  TransportForm deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TransportFormBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'ID':
          result.ID = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

class _$TransportForm extends TransportForm {
  @override
  final int ID;
  @override
  final String title;

  factory _$TransportForm([void Function(TransportFormBuilder) updates]) =>
      (new TransportFormBuilder()..update(updates)).build();

  _$TransportForm._({this.ID, this.title}) : super._();

  @override
  TransportForm rebuild(void Function(TransportFormBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransportFormBuilder toBuilder() => new TransportFormBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransportForm && ID == other.ID && title == other.title;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, ID.hashCode), title.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TransportForm')
          ..add('ID', ID)
          ..add('title', title))
        .toString();
  }
}

class TransportFormBuilder
    implements Builder<TransportForm, TransportFormBuilder> {
  _$TransportForm _$v;

  int _ID;
  int get ID => _$this._ID;
  set ID(int ID) => _$this._ID = ID;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  TransportFormBuilder() {
    TransportForm._initializeBuilder(this);
  }

  TransportFormBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ID = $v.ID;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransportForm other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransportForm;
  }

  @override
  void update(void Function(TransportFormBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TransportForm build() {
    final _$result = _$v ?? new _$TransportForm._(ID: ID, title: title);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
