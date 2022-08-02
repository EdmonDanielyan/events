// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'register_params.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RegisterParams> _$registerParamsSerializer =
    new _$RegisterParamsSerializer();

class _$RegisterParamsSerializer
    implements StructuredSerializer<RegisterParams> {
  @override
  final Iterable<Type> types = const [RegisterParams, _$RegisterParams];
  @override
  final String wireName = 'RegisterParams';

  @override
  Iterable<Object> serialize(Serializers serializers, RegisterParams object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.firstName;
    if (value != null) {
      result
        ..add('firstName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastName;
    if (value != null) {
      result
        ..add('lastName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.secondName;
    if (value != null) {
      result
        ..add('secondName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.password;
    if (value != null) {
      result
        ..add('password')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tabelNumber;
    if (value != null) {
      result
        ..add('tabelNumber')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
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
    return result;
  }

  @override
  RegisterParams deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RegisterParamsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'secondName':
          result.secondName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tabelNumber':
          result.tabelNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'birthday':
          result.birthday = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

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

  factory _$RegisterParams([void Function(RegisterParamsBuilder) updates]) =>
      (new RegisterParamsBuilder()..update(updates))._build();

  _$RegisterParams._(
      {this.firstName,
      this.lastName,
      this.secondName,
      this.password,
      this.tabelNumber,
      this.phone,
      this.birthday})
      : super._();

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
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, firstName.hashCode), lastName.hashCode),
                        secondName.hashCode),
                    password.hashCode),
                tabelNumber.hashCode),
            phone.hashCode),
        birthday.hashCode));
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
  _$RegisterParams _$v;

  String _firstName;
  String get firstName => _$this._firstName;
  set firstName(String firstName) => _$this._firstName = firstName;

  String _lastName;
  String get lastName => _$this._lastName;
  set lastName(String lastName) => _$this._lastName = lastName;

  String _secondName;
  String get secondName => _$this._secondName;
  set secondName(String secondName) => _$this._secondName = secondName;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  int _tabelNumber;
  int get tabelNumber => _$this._tabelNumber;
  set tabelNumber(int tabelNumber) => _$this._tabelNumber = tabelNumber;

  String _phone;
  String get phone => _$this._phone;
  set phone(String phone) => _$this._phone = phone;

  String _birthday;
  String get birthday => _$this._birthday;
  set birthday(String birthday) => _$this._birthday = birthday;

  RegisterParamsBuilder() {
    RegisterParams._initializeBuilder(this);
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
  void update(void Function(RegisterParamsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterParams build() => _build();

  _$RegisterParams _build() {
    final _$result = _$v ??
        new _$RegisterParams._(
            firstName: firstName,
            lastName: lastName,
            secondName: secondName,
            password: password,
            tabelNumber: tabelNumber,
            phone: phone,
            birthday: birthday);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
