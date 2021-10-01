import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/textfields/service_textfield.dart';
import 'package:ink_mobile/core/masks/textfield_masks.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/screens/medical_insurance/components/form/entities.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MedicalInsuranceGuarLetFields extends StatelessWidget {
  final MedicalInsuranceFormEntities entities;
  const MedicalInsuranceGuarLetFields({Key? key, required this.entities})
      : super(key: key);
  static late LanguageStrings _strings;

  @override
  Widget build(BuildContext context) {
    _strings = BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    return Column(
      children: [
        _descriptionWidget(),
        SizedBox(height: 20),
        _dateWidget(),
      ],
    );
  }

  Widget _descriptionWidget() {
    return Text(_strings.extGuarantLetterDesc);
  }

  Widget _dateWidget() {
    MaskTextInputFormatter mask = TextFieldMasks.date;
    return ServiceTextField(
      hint: _strings.dateHint,
      validator: (val) =>
          !mask.isFill() || val!.isEmpty ? _strings.fillTheField : null,
      onChanged: (val) => entities.guaranteeLetterDate = val,
      keyboardType: TextInputType.datetime,
      inputFormatters: [mask],
    );
  }
}
