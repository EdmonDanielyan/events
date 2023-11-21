// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_params.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegisterParams extends RegisterParams {
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String secondName;
  @override
  final String password;
  @override
  final int tabelNumber;
  @override
  final String phone;
  @override
  final String birthday;

  factory _$RegisterParams([void Function(RegisterParamsBuilder)? updates]) =>
      (new RegisterParamsBuilder()..update(updates))._build();

  _$RegisterParams._(
      {required this.firstName,
      required this.lastName,
      required this.secondName,
      required this.password,
      required this.tabelNumber,
      required this.phone,
      required this.birthday})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firstName, r'RegisterParams', 'firstName');
    BuiltValueNullFieldError.checkNotNull(
        lastName, r'RegisterParams', 'lastName');
    BuiltValueNullFieldError.checkNotNull(
        secondName, r'RegisterParams', 'secondName');
    BuiltValueNullFieldError.checkNotNull(
        password, r'RegisterParams', 'password');
    BuiltValueNullFieldError.checkNotNull(
        tabelNumber, r'RegisterParams', 'tabelNumber');
    BuiltValueNullFieldError.checkNotNull(phone, r'RegisterParams', 'phone');
    BuiltValueNullFieldError.checkNotNull(
        birthday, r'RegisterParams', 'birthday');
  }

  @override
  RegisterParams rebuild(void Function(RegisterParamsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterParamsBuilder toBuilder() =>
      new RegisterParamsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterParams &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        secondName == other.secondName &&
        password == other.password &&
        tabelNumber == other.tabelNumber &&
        phone == other.phone &&
        birthday == other.birthday;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, secondName.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, tabelNumber.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, birthday.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterParams')
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('secondName', secondName)
          ..add('password', password)
          ..add('tabelNumber', tabelNumber)
          ..add('phone', phone)
          ..add('birthday', birthday))
        .toString();
  }
}

class RegisterParamsBuilder
    implements Builder<RegisterParams, RegisterParamsBuilder> {
  _$RegisterParams? _$v;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _secondName;
  String? get secondName => _$this._secondName;
  set secondName(String? secondName) => _$this._secondName = secondName;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  int? _tabelNumber;
  int? get tabelNumber => _$this._tabelNumber;
  set tabelNumber(int? tabelNumber) => _$this._tabelNumber = tabelNumber;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _birthday;
  String? get birthday => _$this._birthday;
  set birthday(String? birthday) => _$this._birthday = birthday;

  RegisterParamsBuilder() {
    RegisterParams._defaults(this);
  }

  RegisterParamsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _secondName = $v.secondName;
      _password = $v.password;
      _tabelNumber = $v.tabelNumber;
      _phone = $v.phone;
      _birthday = $v.birthday;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterParams other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterParams;
  }

  @override
  void update(void Function(RegisterParamsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterParams build() => _build();

  _$RegisterParams _build() {
    final _$result = _$v ??
        new _$RegisterParams._(
            firstName: BuiltValueNullFieldError.checkNotNull(
                firstName, r'RegisterParams', 'firstName'),
            lastName: BuiltValueNullFieldError.checkNotNull(
                lastName, r'RegisterParams', 'lastName'),
            secondName: BuiltValueNullFieldError.checkNotNull(
                secondName, r'RegisterParams', 'secondName'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, r'RegisterParams', 'password'),
            tabelNumber: BuiltValueNullFieldError.checkNotNull(
                tabelNumber, r'RegisterParams', 'tabelNumber'),
            phone: BuiltValueNullFieldError.checkNotNull(
                phone, r'RegisterParams', 'phone'),
            birthday: BuiltValueNullFieldError.checkNotNull(
                birthday, r'RegisterParams', 'birthday'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
