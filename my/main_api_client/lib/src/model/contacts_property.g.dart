// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_property.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ContactsProperty extends ContactsProperty {
  @override
  final int id;
  @override
  final String lastName;
  @override
  final String? name;
  @override
  final String? secondName;
  @override
  final String? photo;
  @override
  final bool isMobileUser;
  @override
  final String? workPosition;
  @override
  final String? city;
  @override
  final String? street;
  @override
  final DateTime? birthday;
  @override
  final BuiltList<ContactsPropertyAbsenceInner>? absence;

  factory _$ContactsProperty(
          [void Function(ContactsPropertyBuilder)? updates]) =>
      (new ContactsPropertyBuilder()..update(updates))._build();

  _$ContactsProperty._(
      {required this.id,
      required this.lastName,
      this.name,
      this.secondName,
      this.photo,
      required this.isMobileUser,
      this.workPosition,
      this.city,
      this.street,
      this.birthday,
      this.absence})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'ContactsProperty', 'id');
    BuiltValueNullFieldError.checkNotNull(
        lastName, r'ContactsProperty', 'lastName');
    BuiltValueNullFieldError.checkNotNull(
        isMobileUser, r'ContactsProperty', 'isMobileUser');
  }

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
        isMobileUser == other.isMobileUser &&
        workPosition == other.workPosition &&
        city == other.city &&
        street == other.street &&
        birthday == other.birthday &&
        absence == other.absence;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, secondName.hashCode);
    _$hash = $jc(_$hash, photo.hashCode);
    _$hash = $jc(_$hash, isMobileUser.hashCode);
    _$hash = $jc(_$hash, workPosition.hashCode);
    _$hash = $jc(_$hash, city.hashCode);
    _$hash = $jc(_$hash, street.hashCode);
    _$hash = $jc(_$hash, birthday.hashCode);
    _$hash = $jc(_$hash, absence.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ContactsProperty')
          ..add('id', id)
          ..add('lastName', lastName)
          ..add('name', name)
          ..add('secondName', secondName)
          ..add('photo', photo)
          ..add('isMobileUser', isMobileUser)
          ..add('workPosition', workPosition)
          ..add('city', city)
          ..add('street', street)
          ..add('birthday', birthday)
          ..add('absence', absence))
        .toString();
  }
}

class ContactsPropertyBuilder
    implements Builder<ContactsProperty, ContactsPropertyBuilder> {
  _$ContactsProperty? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _secondName;
  String? get secondName => _$this._secondName;
  set secondName(String? secondName) => _$this._secondName = secondName;

  String? _photo;
  String? get photo => _$this._photo;
  set photo(String? photo) => _$this._photo = photo;

  bool? _isMobileUser;
  bool? get isMobileUser => _$this._isMobileUser;
  set isMobileUser(bool? isMobileUser) => _$this._isMobileUser = isMobileUser;

  String? _workPosition;
  String? get workPosition => _$this._workPosition;
  set workPosition(String? workPosition) => _$this._workPosition = workPosition;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  String? _street;
  String? get street => _$this._street;
  set street(String? street) => _$this._street = street;

  DateTime? _birthday;
  DateTime? get birthday => _$this._birthday;
  set birthday(DateTime? birthday) => _$this._birthday = birthday;

  ListBuilder<ContactsPropertyAbsenceInner>? _absence;
  ListBuilder<ContactsPropertyAbsenceInner> get absence =>
      _$this._absence ??= new ListBuilder<ContactsPropertyAbsenceInner>();
  set absence(ListBuilder<ContactsPropertyAbsenceInner>? absence) =>
      _$this._absence = absence;

  ContactsPropertyBuilder() {
    ContactsProperty._defaults(this);
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
      _workPosition = $v.workPosition;
      _city = $v.city;
      _street = $v.street;
      _birthday = $v.birthday;
      _absence = $v.absence?.toBuilder();
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
  void update(void Function(ContactsPropertyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ContactsProperty build() => _build();

  _$ContactsProperty _build() {
    _$ContactsProperty _$result;
    try {
      _$result = _$v ??
          new _$ContactsProperty._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'ContactsProperty', 'id'),
              lastName: BuiltValueNullFieldError.checkNotNull(
                  lastName, r'ContactsProperty', 'lastName'),
              name: name,
              secondName: secondName,
              photo: photo,
              isMobileUser: BuiltValueNullFieldError.checkNotNull(
                  isMobileUser, r'ContactsProperty', 'isMobileUser'),
              workPosition: workPosition,
              city: city,
              street: street,
              birthday: birthday,
              absence: _absence?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'absence';
        _absence?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ContactsProperty', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
