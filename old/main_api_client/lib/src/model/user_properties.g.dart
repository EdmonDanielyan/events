// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_properties.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserProperties extends UserProperties {
  @override
  final int id;
  @override
  final String? name;
  @override
  final String? secondName;
  @override
  final String? lastName;
  @override
  final String? workPosition;
  @override
  final String? workCity;
  @override
  final DateTime? birthday;
  @override
  final String? birthdayString;
  @override
  final String? avatar;

  factory _$UserProperties([void Function(UserPropertiesBuilder)? updates]) =>
      (new UserPropertiesBuilder()..update(updates))._build();

  _$UserProperties._(
      {required this.id,
      this.name,
      this.secondName,
      this.lastName,
      this.workPosition,
      this.workCity,
      this.birthday,
      this.birthdayString,
      this.avatar})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'UserProperties', 'id');
  }

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
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, secondName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, workPosition.hashCode);
    _$hash = $jc(_$hash, workCity.hashCode);
    _$hash = $jc(_$hash, birthday.hashCode);
    _$hash = $jc(_$hash, birthdayString.hashCode);
    _$hash = $jc(_$hash, avatar.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserProperties')
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
  _$UserProperties? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _secondName;
  String? get secondName => _$this._secondName;
  set secondName(String? secondName) => _$this._secondName = secondName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _workPosition;
  String? get workPosition => _$this._workPosition;
  set workPosition(String? workPosition) => _$this._workPosition = workPosition;

  String? _workCity;
  String? get workCity => _$this._workCity;
  set workCity(String? workCity) => _$this._workCity = workCity;

  DateTime? _birthday;
  DateTime? get birthday => _$this._birthday;
  set birthday(DateTime? birthday) => _$this._birthday = birthday;

  String? _birthdayString;
  String? get birthdayString => _$this._birthdayString;
  set birthdayString(String? birthdayString) =>
      _$this._birthdayString = birthdayString;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  UserPropertiesBuilder() {
    UserProperties._defaults(this);
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
  void update(void Function(UserPropertiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserProperties build() => _build();

  _$UserProperties _build() {
    final _$result = _$v ??
        new _$UserProperties._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'UserProperties', 'id'),
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

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
