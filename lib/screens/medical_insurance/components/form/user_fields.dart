import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/textfields/service_textfield.dart';
import 'package:ink_mobile/core/masks/input_formatters.dart';
import 'package:ink_mobile/core/masks/textfield_masks.dart';
import 'package:ink_mobile/core/validator/field_validator.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'entities.dart';

class MedicalInsuranceFormUserFields extends StatelessWidget {
  final MedicalInsuranceFormEntities entities;
  const MedicalInsuranceFormUserFields({Key? key, required this.entities})
      : super(key: key);
  static late LanguageStrings _strings;

  @override
  Widget build(BuildContext context) {
    _strings = BlocProvider.of<LocalizationCubit>(context, listen: true).state;
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
      ],
    );
  }

  Widget _fioWidget() {
    return ServiceTextField(
      hint: _strings.fullnameHint,
      requiredIcon: true,
      validator: (val) =>
          val!.split(" ").length < 3 ? _strings.fillTheField : null,
      autocorrect: false,
      inputFormatters: [InputFormatters.lettersOnly],
      onChanged: (val) => entities.fio = val,
    );
  }

  Widget _birthDate() {
    MaskTextInputFormatter mask = TextFieldMasks.date;
    return ServiceTextField(
      hint: _strings.birthDate,
      requiredIcon: true,
      validator: (val) =>
          !mask.isFill() || val!.isEmpty ? _strings.fillTheField : null,
      onChanged: (val) => entities.birthDate = val,
      keyboardType: TextInputType.datetime,
      inputFormatters: [mask],
    );
  }

  Widget _positionWidget() {
    return ServiceTextField(
      hint: _strings.position,
      requiredIcon: true,
      validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
      inputFormatters: [InputFormatters.lettersOnly],
      onChanged: (val) => entities.position = val,
    );
  }

  Widget _mobilePhoneWidget() {
    MaskTextInputFormatter mask = TextFieldMasks.phone;
    return ServiceTextField(
      hint: _strings.mobilePhone,
      requiredIcon: true,
      validator: (val) =>
          !mask.isFill() || val!.isEmpty ? _strings.fillTheField : null,
      onChanged: (val) => entities.phone = val,
      keyboardType: TextInputType.phone,
      inputFormatters: [mask],
    );
  }

  Widget _emailWidget() {
    return ServiceTextField(
      hint: _strings.email,
      requiredIcon: true,
      validator: (val) => FieldValidator.emailValidator(val, _strings),
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      onChanged: (val) => entities.email = val,
    );
  }
}
