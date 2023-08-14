// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'order_dms.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrderDMS> _$orderDMSSerializer = new _$OrderDMSSerializer();

class _$OrderDMSSerializer implements StructuredSerializer<OrderDMS> {
  @override
  final Iterable<Type> types = const [OrderDMS, _$OrderDMS];
  @override
  final String wireName = 'OrderDMS';

  @override
  Iterable<Object> serialize(Serializers serializers, OrderDMS object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.dmsType;
    if (value != null) {
      result
        ..add('dms_type')
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
    value = object.firstName;
    if (value != null) {
      result
        ..add('first_name')
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
    value = object.birthday;
    if (value != null) {
      result
        ..add('birthday')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.organisationId;
    if (value != null) {
      result
        ..add('organisation_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.workPosition;
    if (value != null) {
      result
        ..add('work_position')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
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
    value = object.additionalInformation;
    if (value != null) {
      result
        ..add('additional_information')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dentalSelect;
    if (value != null) {
      result
        ..add('dental_select')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.specSelect;
    if (value != null) {
      result
        ..add('spec_select')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.labSelect;
    if (value != null) {
      result
        ..add('lab_select')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.otherSelect;
    if (value != null) {
      result
        ..add('other_select')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.specText;
    if (value != null) {
      result
        ..add('spec_text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.labText;
    if (value != null) {
      result
        ..add('lab_text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.otherText;
    if (value != null) {
      result
        ..add('other_text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.clinic;
    if (value != null) {
      result
        ..add('clinic')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.city;
    if (value != null) {
      result
        ..add('city')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.money;
    if (value != null) {
      result
        ..add('money')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateTo;
    if (value != null) {
      result
        ..add('date_to')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  OrderDMS deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderDMSBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'dms_type':
          result.dmsType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'last_name':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'first_name':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'second_name':
          result.secondName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'birthday':
          result.birthday = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'organisation_id':
          result.organisationId = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'work_position':
          result.workPosition = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'additional_information':
          result.additionalInformation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'dental_select':
          result.dentalSelect = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'spec_select':
          result.specSelect = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'lab_select':
          result.labSelect = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'other_select':
          result.otherSelect = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'spec_text':
          result.specText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lab_text':
          result.labText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'other_text':
          result.otherText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'clinic':
          result.clinic = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'money':
          result.money = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date_to':
          result.dateTo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

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
  final num organisationId;
  @override
  final String workPosition;
  @override
  final String phone;
  @override
  final String email;
  @override
  final String additionalInformation;
  @override
  final bool dentalSelect;
  @override
  final bool specSelect;
  @override
  final bool labSelect;
  @override
  final bool otherSelect;
  @override
  final String specText;
  @override
  final String labText;
  @override
  final String otherText;
  @override
  final String clinic;
  @override
  final String city;
  @override
  final String address;
  @override
  final String money;
  @override
  final String date;
  @override
  final String dateTo;

  factory _$OrderDMS([void Function(OrderDMSBuilder) updates]) =>
      (new OrderDMSBuilder()..update(updates))._build();

  _$OrderDMS._(
      {this.dmsType,
      this.lastName,
      this.firstName,
      this.secondName,
      this.birthday,
      this.organisationId,
      this.workPosition,
      this.phone,
      this.email,
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
      : super._();

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
  _$OrderDMS _$v;

  String _dmsType;
  String get dmsType => _$this._dmsType;
  set dmsType(String dmsType) => _$this._dmsType = dmsType;

  String _lastName;
  String get lastName => _$this._lastName;
  set lastName(String lastName) => _$this._lastName = lastName;

  String _firstName;
  String get firstName => _$this._firstName;
  set firstName(String firstName) => _$this._firstName = firstName;

  String _secondName;
  String get secondName => _$this._secondName;
  set secondName(String secondName) => _$this._secondName = secondName;

  String _birthday;
  String get birthday => _$this._birthday;
  set birthday(String birthday) => _$this._birthday = birthday;

  num _organisationId;
  num get organisationId => _$this._organisationId;
  set organisationId(num organisationId) =>
      _$this._organisationId = organisationId;

  String _workPosition;
  String get workPosition => _$this._workPosition;
  set workPosition(String workPosition) => _$this._workPosition = workPosition;

  String _phone;
  String get phone => _$this._phone;
  set phone(String phone) => _$this._phone = phone;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _additionalInformation;
  String get additionalInformation => _$this._additionalInformation;
  set additionalInformation(String additionalInformation) =>
      _$this._additionalInformation = additionalInformation;

  bool _dentalSelect;
  bool get dentalSelect => _$this._dentalSelect;
  set dentalSelect(bool dentalSelect) => _$this._dentalSelect = dentalSelect;

  bool _specSelect;
  bool get specSelect => _$this._specSelect;
  set specSelect(bool specSelect) => _$this._specSelect = specSelect;

  bool _labSelect;
  bool get labSelect => _$this._labSelect;
  set labSelect(bool labSelect) => _$this._labSelect = labSelect;

  bool _otherSelect;
  bool get otherSelect => _$this._otherSelect;
  set otherSelect(bool otherSelect) => _$this._otherSelect = otherSelect;

  String _specText;
  String get specText => _$this._specText;
  set specText(String specText) => _$this._specText = specText;

  String _labText;
  String get labText => _$this._labText;
  set labText(String labText) => _$this._labText = labText;

  String _otherText;
  String get otherText => _$this._otherText;
  set otherText(String otherText) => _$this._otherText = otherText;

  String _clinic;
  String get clinic => _$this._clinic;
  set clinic(String clinic) => _$this._clinic = clinic;

  String _city;
  String get city => _$this._city;
  set city(String city) => _$this._city = city;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _money;
  String get money => _$this._money;
  set money(String money) => _$this._money = money;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  String _dateTo;
  String get dateTo => _$this._dateTo;
  set dateTo(String dateTo) => _$this._dateTo = dateTo;

  OrderDMSBuilder() {
    OrderDMS._initializeBuilder(this);
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
  void update(void Function(OrderDMSBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderDMS build() => _build();

  _$OrderDMS _build() {
    final _$result = _$v ??
        new _$OrderDMS._(
            dmsType: dmsType,
            lastName: lastName,
            firstName: firstName,
            secondName: secondName,
            birthday: birthday,
            organisationId: organisationId,
            workPosition: workPosition,
            phone: phone,
            email: email,
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
