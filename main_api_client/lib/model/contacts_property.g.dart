// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'contacts_property.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ContactsProperty> _$contactsPropertySerializer =
    new _$ContactsPropertySerializer();

class _$ContactsPropertySerializer
    implements StructuredSerializer<ContactsProperty> {
  @override
  final Iterable<Type> types = const [ContactsProperty, _$ContactsProperty];
  @override
  final String wireName = 'ContactsProperty';

  @override
  Iterable<Object> serialize(Serializers serializers, ContactsProperty object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.lastName;
    if (value != null) {
      result
        ..add('last_name')
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
    value = object.secondName;
    if (value != null) {
      result
        ..add('second_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photo;
    if (value != null) {
      result
        ..add('photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isMobileUser;
    if (value != null) {
      result
        ..add('is_mobile_user')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  ContactsProperty deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContactsPropertyBuilder();

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
        case 'last_name':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'second_name':
          result.secondName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photo':
          result.photo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'is_mobile_user':
          result.isMobileUser = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$ContactsProperty extends ContactsProperty {
  @override
  final int id;
  @override
  final String lastName;
  @override
  final String name;
  @override
  final String secondName;
  @override
  final String photo;
  @override
  final bool isMobileUser;

  factory _$ContactsProperty(
          [void Function(ContactsPropertyBuilder) updates]) =>
      (new ContactsPropertyBuilder()..update(updates))._build();

  _$ContactsProperty._(
      {this.id,
      this.lastName,
      this.name,
      this.secondName,
      this.photo,
      this.isMobileUser})
      : super._();

  @override
  ContactsProperty rebuild(void Function(ContactsPropertyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactsPropertyBuilder toBuilder() =>
      new ContactsPropertyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactsProperty &&
        id == other.id &&
        lastName == other.lastName &&
        name == other.name &&
        secondName == other.secondName &&
        photo == other.photo &&
        isMobileUser == other.isMobileUser;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, id.hashCode), lastName.hashCode), name.hashCode),
                secondName.hashCode),
            photo.hashCode),
        isMobileUser.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ContactsProperty')
          ..add('id', id)
          ..add('lastName', lastName)
          ..add('name', name)
          ..add('secondName', secondName)
          ..add('photo', photo)
          ..add('isMobileUser', isMobileUser))
        .toString();
  }
}

class ContactsPropertyBuilder
    implements Builder<ContactsProperty, ContactsPropertyBuilder> {
  _$ContactsProperty _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _lastName;
  String get lastName => _$this._lastName;
  set lastName(String lastName) => _$this._lastName = lastName;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _secondName;
  String get secondName => _$this._secondName;
  set secondName(String secondName) => _$this._secondName = secondName;

  String _photo;
  String get photo => _$this._photo;
  set photo(String photo) => _$this._photo = photo;

  bool _isMobileUser;
  bool get isMobileUser => _$this._isMobileUser;
  set isMobileUser(bool isMobileUser) => _$this._isMobileUser = isMobileUser;

  ContactsPropertyBuilder() {
    ContactsProperty._initializeBuilder(this);
  }

  ContactsPropertyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _lastName = $v.lastName;
      _name = $v.name;
      _secondName = $v.secondName;
      _photo = $v.photo;
      _isMobileUser = $v.isMobileUser;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContactsProperty other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ContactsProperty;
  }

  @override
  void update(void Function(ContactsPropertyBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ContactsProperty build() => _build();

  _$ContactsProperty _build() {
    final _$result = _$v ??
        new _$ContactsProperty._(
            id: id,
            lastName: lastName,
            name: name,
            secondName: secondName,
            photo: photo,
            isMobileUser: isMobileUser);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
