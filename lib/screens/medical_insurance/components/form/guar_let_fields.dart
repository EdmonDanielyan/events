import 'package:flutter/material.dart';
import 'package:ink_mobile/components/textfields/service_textfield.dart';
import 'package:ink_mobile/core/masks/textfield_masks.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/medical_insurance/components/form/entities.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MedicalInsuranceGuarLetFields extends StatelessWidget {
  final MedicalInsuranceFormEntities entities;
  const MedicalInsuranceGuarLetFields({Key? key, required this.entities})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _descriptionWidget(),
        SizedBox(height: 20),
        _dateWidget(),
      ],
    );
  }

  Widget _descriptionWidget() {
    return Text(localizationInstance.extGuarantLetterDesc);
  }

  Widget _dateWidget() {
    MaskTextInputFormatter mask = TextFieldMasks.date;
    final _strings = localizationInstance;
    return ServiceTextField(
      hint: _strings.dateHint,
      requiredIcon: true,
      validator: (val) =>
          !mask.isFill() || val!.isEmpty ? _strings.fillTheField : null,
      onChanged: (val) => entities.guaranteeLetterDate = val,
      keyboardType: TextInputType.datetime,
      inputFormatters: [mask],
    );
  }
}
