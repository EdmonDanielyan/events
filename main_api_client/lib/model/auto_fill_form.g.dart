// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'auto_fill_form.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AutoFillForm> _$autoFillFormSerializer =
    new _$AutoFillFormSerializer();

class _$AutoFillFormSerializer implements StructuredSerializer<AutoFillForm> {
  @override
  final Iterable<Type> types = const [AutoFillForm, _$AutoFillForm];
  @override
  final String wireName = 'AutoFillForm';

  @override
  Iterable<Object> serialize(Serializers serializers, AutoFillForm object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.fio;
    if (value != null) {
      result
        ..add('fio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.position;
    if (value != null) {
      result
        ..add('position')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.department;
    if (value != null) {
      result
        ..add('department')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AutoFillForm deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AutoFillFormBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'fio':
          result.fio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'position':
          result.position = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'department':
          result.department = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AutoFillForm extends AutoFillForm {
  @override
  final String fio;
  @override
  final String position;
  @override
  final String department;
  @override
  final String email;

  factory _$AutoFillForm([void Function(AutoFillFormBuilder) updates]) =>
      (new AutoFillFormBuilder()..update(updates)).build();

  _$AutoFillForm._({this.fio, this.position, this.department, this.email})
      : super._();

  @override
  AutoFillForm rebuild(void Function(AutoFillFormBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AutoFillFormBuilder toBuilder() => new AutoFillFormBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AutoFillForm &&
        fio == other.fio &&
        position == other.position &&
        department == other.department &&
        email == other.email;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, fio.hashCode), position.hashCode), department.hashCode),
        email.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AutoFillForm')
          ..add('fio', fio)
          ..add('position', position)
          ..add('department', department)
          ..add('email', email))
        .toString();
  }
}

class AutoFillFormBuilder
    implements Builder<AutoFillForm, AutoFillFormBuilder> {
  _$AutoFillForm _$v;

  String _fio;
  String get fio => _$this._fio;
  set fio(String fio) => _$this._fio = fio;

  String _position;
  String get position => _$this._position;
  set position(String position) => _$this._position = position;

  String _department;
  String get department => _$this._department;
  set department(String department) => _$this._department = department;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  AutoFillFormBuilder() {
    AutoFillForm._initializeBuilder(this);
  }

  AutoFillFormBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fio = $v.fio;
      _position = $v.position;
      _department = $v.department;
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AutoFillForm other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AutoFillForm;
  }

  @override
  void update(void Function(AutoFillFormBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AutoFillForm build() {
    final _$result = _$v ??
        new _$AutoFillForm._(
            fio: fio, position: position, department: department, email: email);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
