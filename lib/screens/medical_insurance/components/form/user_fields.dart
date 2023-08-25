import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ink_mobile/components/textfields/service_textfield.dart';
import 'package:ink_mobile/components/textfields/service_disabled_textfield.dart';
import 'package:ink_mobile/core/masks/textfield_masks.dart';
import 'package:ink_mobile/core/validator/field_validator.dart';
import 'package:ink_mobile/cubit/autofill/get_autofill.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ink_mobile/messenger/utils/date_functions.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../components/date_input_field.dart';
import 'entities.dart';

class MedicalInsuranceFormUserFields extends StatefulWidget {
  final MedicalInsuranceFormEntities entities;

  const MedicalInsuranceFormUserFields({Key? key, required this.entities})
      : super(key: key);

  @override
  _MedicalInsuranceFormUserFieldsState createState() =>
      _MedicalInsuranceFormUserFieldsState();
}

class _MedicalInsuranceFormUserFieldsState
    extends State<MedicalInsuranceFormUserFields> {
  late AppLocalizations _strings;
  TextEditingController fioController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  // TODO: CHECK
  TextEditingController organisationController = TextEditingController();

  GetAutofill getAutofill = GetAutofill();

  Future<void> loadData() async {
    await getAutofill.load();
    fioController.text = getAutofill.autofill.fio;
    widget.entities.fio = getAutofill.autofill.fio;
    positionController.text = getAutofill.autofill.position;
    widget.entities.position = getAutofill.autofill.position;
    emailController.text = getAutofill.autofill.email;
    widget.entities.email = getAutofill.autofill.email;

    // TODO: CHECK
    organisationController.text = getAutofill.autofill.organisation.isEmpty ? 'ООО "ИНК"': getAutofill.autofill.organisation;
    widget.entities.organisation = getAutofill.autofill.organisation.isEmpty ? 'ООО "ИНК"': getAutofill.autofill.organisation;

    if (getAutofill.autofill.birthday.isNotEmpty) {
      final birthday = DateTime.tryParse(getAutofill.autofill.birthday);

      if (birthday != null) {
        final date = DateFunctions(passedDate: birthday).dayMonthYearNumbers();
        widget.entities.birthDate = date;
        birthdayController.text = date;
      }
    }
    if (getAutofill.autofill.phone.isNotEmpty) {
      final phone =
          TextFieldMasks().phone().maskText(getAutofill.autofill.phone);
      widget.entities.phone = phone;
      phoneController.text = phone;
    }
  }

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    return Column(
      children: [
        _fioWidget(),
        SizedBox(height: 20),
        _birthDate(),
        SizedBox(height: 20),
        _positionWidget(),
        SizedBox(height: 20),
        _mobilePhoneWidget(),
        SizedBox(height: 20),
        _emailWidget(),
        SizedBox(height: 20),
        _organisationWidget(),
      ],
    );
  }

  Widget _fioWidget() {
    return ServiceTextField(
      controller: fioController,
      hint: _strings.fullnameHint,
      validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
      autocorrect: false,
      onChanged: (val) => widget.entities.fio = val,
      descriptionText: "Ваше ФИО",
      focusNode: FocusNode(),
    );
  }

  Widget _organisationWidget() {
    return ServiceDisabledTextField(
      controller: organisationController,
      hint: "Организация",
      validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
      autocorrect: false,
      onChanged: (val) => widget.entities.organisation = val,
      descriptionText: "Организация",
      focusNode: FocusNode(),
    );
  }

  Widget _birthDate() {
    return DateInputField(
      controller: TextEditingController(),
      title: _strings.birthDate,
      validator: (val) => val!.length <= 8 ? _strings.fillTheField : null,
      onChanged: (val) {
        widget.entities.birthDate =
            DateFunctions(passedDate: val).dayMonthYearNumbers();
      },
      descriptionText: "Дата рождения",
    );
  }

  Widget _positionWidget() {
    return ServiceTextField(
      controller: positionController,
      hint: _strings.position,
      validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
      onChanged: (val) => widget.entities.position = val,
      descriptionText: "Должность",
      focusNode: FocusNode(),
    );
  }

  Widget _mobilePhoneWidget() {
    MaskTextInputFormatter mask =
        TextFieldMasks().phone(initialText: widget.entities.phone);
    return ServiceTextField(
      hint: "+7 (ххх) xxx-xx-xx",
      controller: phoneController,
      validator: (val) => val!.length < 17 ? _strings.fillTheField : null,
      onChanged: (val) => widget.entities.phone = val,
      keyboardType: TextInputType.phone,
      inputFormatters: [mask],
      descriptionText: "Номер телефона",
      focusNode: FocusNode(),
    );
  }

  Widget _emailWidget() {
    return ServiceTextField(
      controller: emailController,
      hint: _strings.email,
      validator: (val) => FieldValidator(_strings).emailValidator(val),
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      onChanged: (val) => widget.entities.email = val,
      descriptionText: "Эл. почта",
      focusNode: FocusNode(),
    );
  }
}
