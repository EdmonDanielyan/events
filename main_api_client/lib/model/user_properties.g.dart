// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'user_properties.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserProperties> _$userPropertiesSerializer =
    new _$UserPropertiesSerializer();

class _$UserPropertiesSerializer
    implements StructuredSerializer<UserProperties> {
  @override
  final Iterable<Type> types = const [UserProperties, _$UserProperties];
  @override
  final String wireName = 'UserProperties';

  @override
  Iterable<Object> serialize(Serializers serializers, UserProperties object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
    value = object.lastName;
    if (value != null) {
      result
        ..add('last_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.workPosition;
    if (value != null) {
      result
        ..add('work_position')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.workCity;
    if (value != null) {
      result
        ..add('work_city')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.birthday;
    if (value != null) {
      result
        ..add('birthday')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.birthdayString;
    if (value != null) {
      result
        ..add('birthday_string')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.avatar;
    if (value != null) {
      result
        ..add('avatar')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UserProperties deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserPropertiesBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'second_name':
          result.secondName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'last_name':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'work_position':
          result.workPosition = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'work_city':
          result.workCity = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'birthday':
          result.birthday = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'birthday_string':
          result.birthdayString = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'avatar':
          result.avatar = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UserProperties extends UserProperties {
  @override
  final int id;
  @override
  final String name;
  @override
  final String secondName;
  @override
  final String lastName;
  @override
  final String workPosition;
  @override
  final String workCity;
  @override
  final DateTime birthday;
  @override
  final String birthdayString;
  @override
  final String avatar;

  factory _$UserProperties([void Function(UserPropertiesBuilder) updates]) =>
      (new UserPropertiesBuilder()..update(updates)).build();

  _$UserProperties._(
      {this.id,
      this.name,
      this.secondName,
      this.lastName,
      this.workPosition,
      this.workCity,
      this.birthday,
      this.birthdayString,
      this.avatar})
      : super._();

  @override
  UserProperties rebuild(void Function(UserPropertiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserPropertiesBuilder toBuilder() =>
      new UserPropertiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserProperties &&
        id == other.id &&
        name == other.name &&
        secondName == other.secondName &&
        lastName == other.lastName &&
        workPosition == other.workPosition &&
        workCity == other.workCity &&
        birthday == other.birthday &&
        birthdayString == other.birthdayString &&
        avatar == other.avatar;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), name.hashCode),
                                secondName.hashCode),
                            lastName.hashCode),
                        workPosition.hashCode),
                    workCity.hashCode),
                birthday.hashCode),
            birthdayString.hashCode),
        avatar.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserProperties')
          ..add('id', id)
          ..add('name', name)
          ..add('secondName', secondName)
          ..add('lastName', lastName)
          ..add('workPosition', workPosition)
          ..add('workCity', workCity)
          ..add('birthday', birthday)
          ..add('birthdayString', birthdayString)
          ..add('avatar', avatar))
        .toString();
  }
}

class UserPropertiesBuilder
    implements Builder<UserProperties, UserPropertiesBuilder> {
  _$UserProperties _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _secondName;
  String get secondName => _$this._secondName;
  set secondName(String secondName) => _$this._secondName = secondName;

  String _lastName;
  String get lastName => _$this._lastName;
  set lastName(String lastName) => _$this._lastName = lastName;

  String _workPosition;
  String get workPosition => _$this._workPosition;
  set workPosition(String workPosition) => _$this._workPosition = workPosition;

  String _workCity;
  String get workCity => _$this._workCity;
  set workCity(String workCity) => _$this._workCity = workCity;

  DateTime _birthday;
  DateTime get birthday => _$this._birthday;
  set birthday(DateTime birthday) => _$this._birthday = birthday;

  String _birthdayString;
  String get birthdayString => _$this._birthdayString;
  set birthdayString(String birthdayString) =>
      _$this._birthdayString = birthdayString;

  String _avatar;
  String get avatar => _$this._avatar;
  set avatar(String avatar) => _$this._avatar = avatar;

  UserPropertiesBuilder() {
    UserProperties._initializeBuilder(this);
  }

  UserPropertiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _secondName = $v.secondName;
      _lastName = $v.lastName;
      _workPosition = $v.workPosition;
      _workCity = $v.workCity;
      _birthday = $v.birthday;
      _birthdayString = $v.birthdayString;
      _avatar = $v.avatar;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserProperties other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserProperties;
  }

  @override
  void update(void Function(UserPropertiesBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserProperties build() {
    final _$result = _$v ??
        new _$UserProperties._(
            id: id,
            name: name,
            secondName: secondName,
            lastName: lastName,
            workPosition: workPosition,
            workCity: workCity,
            birthday: birthday,
            birthdayString: birthdayString,
            avatar: avatar);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
