// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_fill_form.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AutoFillForm extends AutoFillForm {
  @override
  final String? fio;
  @override
  final String? position;
  @override
  final String? organisation;
  @override
  final int? organisationId;
  @override
  final String? department;
  @override
  final int? departmentId;
  @override
  final String? email;
  @override
  final String? birthday;
  @override
  final String? personalPhone;

  factory _$AutoFillForm([void Function(AutoFillFormBuilder)? updates]) =>
      (new AutoFillFormBuilder()..update(updates))._build();

  _$AutoFillForm._(
      {this.fio,
      this.position,
      this.organisation,
      this.organisationId,
      this.department,
      this.departmentId,
      this.email,
      this.birthday,
      this.personalPhone})
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
        organisation == other.organisation &&
        organisationId == other.organisationId &&
        department == other.department &&
        departmentId == other.departmentId &&
        email == other.email &&
        birthday == other.birthday &&
        personalPhone == other.personalPhone;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fio.hashCode);
    _$hash = $jc(_$hash, position.hashCode);
    _$hash = $jc(_$hash, organisation.hashCode);
    _$hash = $jc(_$hash, organisationId.hashCode);
    _$hash = $jc(_$hash, department.hashCode);
    _$hash = $jc(_$hash, departmentId.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, birthday.hashCode);
    _$hash = $jc(_$hash, personalPhone.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AutoFillForm')
          ..add('fio', fio)
          ..add('position', position)
          ..add('organisation', organisation)
          ..add('organisationId', organisationId)
          ..add('department', department)
          ..add('departmentId', departmentId)
          ..add('email', email)
          ..add('birthday', birthday)
          ..add('personalPhone', personalPhone))
        .toString();
  }
}

class AutoFillFormBuilder
    implements Builder<AutoFillForm, AutoFillFormBuilder> {
  _$AutoFillForm? _$v;

  String? _fio;
  String? get fio => _$this._fio;
  set fio(String? fio) => _$this._fio = fio;

  String? _position;
  String? get position => _$this._position;
  set position(String? position) => _$this._position = position;

  String? _organisation;
  String? get organisation => _$this._organisation;
  set organisation(String? organisation) => _$this._organisation = organisation;

  int? _organisationId;
  int? get organisationId => _$this._organisationId;
  set organisationId(int? organisationId) =>
      _$this._organisationId = organisationId;

  String? _department;
  String? get department => _$this._department;
  set department(String? department) => _$this._department = department;

  int? _departmentId;
  int? get departmentId => _$this._departmentId;
  set departmentId(int? departmentId) => _$this._departmentId = departmentId;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _birthday;
  String? get birthday => _$this._birthday;
  set birthday(String? birthday) => _$this._birthday = birthday;

  String? _personalPhone;
  String? get personalPhone => _$this._personalPhone;
  set personalPhone(String? personalPhone) =>
      _$this._personalPhone = personalPhone;

  AutoFillFormBuilder() {
    AutoFillForm._defaults(this);
  }

  AutoFillFormBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fio = $v.fio;
      _position = $v.position;
      _organisation = $v.organisation;
      _organisationId = $v.organisationId;
      _department = $v.department;
      _departmentId = $v.departmentId;
      _email = $v.email;
      _birthday = $v.birthday;
      _personalPhone = $v.personalPhone;
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
  void update(void Function(AutoFillFormBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AutoFillForm build() => _build();

  _$AutoFillForm _build() {
    final _$result = _$v ??
        new _$AutoFillForm._(
            fio: fio,
            position: position,
            organisation: organisation,
            organisationId: organisationId,
            department: department,
            departmentId: departmentId,
            email: email,
            birthday: birthday,
            personalPhone: personalPhone);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
