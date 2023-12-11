// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dms.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OrderDMS extends OrderDMS {
  @override
  final String dmsType;
  @override
  final String lastName;
  @override
  final String firstName;
  @override
  final String secondName;
  @override
  final String birthday;
  @override
  final num? organisationId;
  @override
  final String workPosition;
  @override
  final String phone;
  @override
  final String email;
  @override
  final String? additionalInformation;
  @override
  final bool? dentalSelect;
  @override
  final bool? specSelect;
  @override
  final bool? labSelect;
  @override
  final bool? otherSelect;
  @override
  final String? specText;
  @override
  final String? labText;
  @override
  final String? otherText;
  @override
  final String? clinic;
  @override
  final String? city;
  @override
  final String? address;
  @override
  final String? money;
  @override
  final String? date;
  @override
  final String? dateTo;

  factory _$OrderDMS([void Function(OrderDMSBuilder)? updates]) =>
      (new OrderDMSBuilder()..update(updates))._build();

  _$OrderDMS._(
      {required this.dmsType,
      required this.lastName,
      required this.firstName,
      required this.secondName,
      required this.birthday,
      this.organisationId,
      required this.workPosition,
      required this.phone,
      required this.email,
      this.additionalInformation,
      this.dentalSelect,
      this.specSelect,
      this.labSelect,
      this.otherSelect,
      this.specText,
      this.labText,
      this.otherText,
      this.clinic,
      this.city,
      this.address,
      this.money,
      this.date,
      this.dateTo})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(dmsType, r'OrderDMS', 'dmsType');
    BuiltValueNullFieldError.checkNotNull(lastName, r'OrderDMS', 'lastName');
    BuiltValueNullFieldError.checkNotNull(firstName, r'OrderDMS', 'firstName');
    BuiltValueNullFieldError.checkNotNull(
        secondName, r'OrderDMS', 'secondName');
    BuiltValueNullFieldError.checkNotNull(birthday, r'OrderDMS', 'birthday');
    BuiltValueNullFieldError.checkNotNull(
        workPosition, r'OrderDMS', 'workPosition');
    BuiltValueNullFieldError.checkNotNull(phone, r'OrderDMS', 'phone');
    BuiltValueNullFieldError.checkNotNull(email, r'OrderDMS', 'email');
  }

  @override
  OrderDMS rebuild(void Function(OrderDMSBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderDMSBuilder toBuilder() => new OrderDMSBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderDMS &&
        dmsType == other.dmsType &&
        lastName == other.lastName &&
        firstName == other.firstName &&
        secondName == other.secondName &&
        birthday == other.birthday &&
        organisationId == other.organisationId &&
        workPosition == other.workPosition &&
        phone == other.phone &&
        email == other.email &&
        additionalInformation == other.additionalInformation &&
        dentalSelect == other.dentalSelect &&
        specSelect == other.specSelect &&
        labSelect == other.labSelect &&
        otherSelect == other.otherSelect &&
        specText == other.specText &&
        labText == other.labText &&
        otherText == other.otherText &&
        clinic == other.clinic &&
        city == other.city &&
        address == other.address &&
        money == other.money &&
        date == other.date &&
        dateTo == other.dateTo;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, dmsType.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, secondName.hashCode);
    _$hash = $jc(_$hash, birthday.hashCode);
    _$hash = $jc(_$hash, organisationId.hashCode);
    _$hash = $jc(_$hash, workPosition.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, additionalInformation.hashCode);
    _$hash = $jc(_$hash, dentalSelect.hashCode);
    _$hash = $jc(_$hash, specSelect.hashCode);
    _$hash = $jc(_$hash, labSelect.hashCode);
    _$hash = $jc(_$hash, otherSelect.hashCode);
    _$hash = $jc(_$hash, specText.hashCode);
    _$hash = $jc(_$hash, labText.hashCode);
    _$hash = $jc(_$hash, otherText.hashCode);
    _$hash = $jc(_$hash, clinic.hashCode);
    _$hash = $jc(_$hash, city.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, money.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, dateTo.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrderDMS')
          ..add('dmsType', dmsType)
          ..add('lastName', lastName)
          ..add('firstName', firstName)
          ..add('secondName', secondName)
          ..add('birthday', birthday)
          ..add('organisationId', organisationId)
          ..add('workPosition', workPosition)
          ..add('phone', phone)
          ..add('email', email)
          ..add('additionalInformation', additionalInformation)
          ..add('dentalSelect', dentalSelect)
          ..add('specSelect', specSelect)
          ..add('labSelect', labSelect)
          ..add('otherSelect', otherSelect)
          ..add('specText', specText)
          ..add('labText', labText)
          ..add('otherText', otherText)
          ..add('clinic', clinic)
          ..add('city', city)
          ..add('address', address)
          ..add('money', money)
          ..add('date', date)
          ..add('dateTo', dateTo))
        .toString();
  }
}

class OrderDMSBuilder implements Builder<OrderDMS, OrderDMSBuilder> {
  _$OrderDMS? _$v;

  String? _dmsType;
  String? get dmsType => _$this._dmsType;
  set dmsType(String? dmsType) => _$this._dmsType = dmsType;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _secondName;
  String? get secondName => _$this._secondName;
  set secondName(String? secondName) => _$this._secondName = secondName;

  String? _birthday;
  String? get birthday => _$this._birthday;
  set birthday(String? birthday) => _$this._birthday = birthday;

  num? _organisationId;
  num? get organisationId => _$this._organisationId;
  set organisationId(num? organisationId) =>
      _$this._organisationId = organisationId;

  String? _workPosition;
  String? get workPosition => _$this._workPosition;
  set workPosition(String? workPosition) => _$this._workPosition = workPosition;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _additionalInformation;
  String? get additionalInformation => _$this._additionalInformation;
  set additionalInformation(String? additionalInformation) =>
      _$this._additionalInformation = additionalInformation;

  bool? _dentalSelect;
  bool? get dentalSelect => _$this._dentalSelect;
  set dentalSelect(bool? dentalSelect) => _$this._dentalSelect = dentalSelect;

  bool? _specSelect;
  bool? get specSelect => _$this._specSelect;
  set specSelect(bool? specSelect) => _$this._specSelect = specSelect;

  bool? _labSelect;
  bool? get labSelect => _$this._labSelect;
  set labSelect(bool? labSelect) => _$this._labSelect = labSelect;

  bool? _otherSelect;
  bool? get otherSelect => _$this._otherSelect;
  set otherSelect(bool? otherSelect) => _$this._otherSelect = otherSelect;

  String? _specText;
  String? get specText => _$this._specText;
  set specText(String? specText) => _$this._specText = specText;

  String? _labText;
  String? get labText => _$this._labText;
  set labText(String? labText) => _$this._labText = labText;

  String? _otherText;
  String? get otherText => _$this._otherText;
  set otherText(String? otherText) => _$this._otherText = otherText;

  String? _clinic;
  String? get clinic => _$this._clinic;
  set clinic(String? clinic) => _$this._clinic = clinic;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _money;
  String? get money => _$this._money;
  set money(String? money) => _$this._money = money;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  String? _dateTo;
  String? get dateTo => _$this._dateTo;
  set dateTo(String? dateTo) => _$this._dateTo = dateTo;

  OrderDMSBuilder() {
    OrderDMS._defaults(this);
  }

  OrderDMSBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dmsType = $v.dmsType;
      _lastName = $v.lastName;
      _firstName = $v.firstName;
      _secondName = $v.secondName;
      _birthday = $v.birthday;
      _organisationId = $v.organisationId;
      _workPosition = $v.workPosition;
      _phone = $v.phone;
      _email = $v.email;
      _additionalInformation = $v.additionalInformation;
      _dentalSelect = $v.dentalSelect;
      _specSelect = $v.specSelect;
      _labSelect = $v.labSelect;
      _otherSelect = $v.otherSelect;
      _specText = $v.specText;
      _labText = $v.labText;
      _otherText = $v.otherText;
      _clinic = $v.clinic;
      _city = $v.city;
      _address = $v.address;
      _money = $v.money;
      _date = $v.date;
      _dateTo = $v.dateTo;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderDMS other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrderDMS;
  }

  @override
  void update(void Function(OrderDMSBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderDMS build() => _build();

  _$OrderDMS _build() {
    final _$result = _$v ??
        new _$OrderDMS._(
            dmsType: BuiltValueNullFieldError.checkNotNull(
                dmsType, r'OrderDMS', 'dmsType'),
            lastName: BuiltValueNullFieldError.checkNotNull(
                lastName, r'OrderDMS', 'lastName'),
            firstName: BuiltValueNullFieldError.checkNotNull(
                firstName, r'OrderDMS', 'firstName'),
            secondName: BuiltValueNullFieldError.checkNotNull(
                secondName, r'OrderDMS', 'secondName'),
            birthday: BuiltValueNullFieldError.checkNotNull(
                birthday, r'OrderDMS', 'birthday'),
            organisationId: organisationId,
            workPosition: BuiltValueNullFieldError.checkNotNull(
                workPosition, r'OrderDMS', 'workPosition'),
            phone: BuiltValueNullFieldError.checkNotNull(
                phone, r'OrderDMS', 'phone'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'OrderDMS', 'email'),
            additionalInformation: additionalInformation,
            dentalSelect: dentalSelect,
            specSelect: specSelect,
            labSelect: labSelect,
            otherSelect: otherSelect,
            specText: specText,
            labText: labText,
            otherText: otherText,
            clinic: clinic,
            city: city,
            address: address,
            money: money,
            date: date,
            dateTo: dateTo);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
