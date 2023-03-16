import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/screens/medical_insurance/components/form/entities.dart';

import '../../../../components/date_input_field.dart';
import '../../../../messenger/utils/date_functions.dart';

class MedicalInsuranceGuarLetFields extends StatelessWidget {
  final MedicalInsuranceFormEntities entities;
  const MedicalInsuranceGuarLetFields({Key? key, required this.entities})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          localizationInstance.extGuarantLetterDesc,
          style: FontStyles.rubikP2(color: Palette.textBlack50),
        ),
        const SizedBox(height: 20.0),
        _dateWidget(),
      ],
    );
  }

  Widget _dateWidget() {
    final _strings = localizationInstance;

    return DateInputField(
      controller: TextEditingController(),
      title: _strings.dateHint,
      validator: (val) => val == null ? _strings.fillTheField : null,
      onChanged: (val) {
        entities.guaranteeLetterDate =
            DateFunctions(passedDate: val).dayMonthYearNumbers();
      },
      descriptionText: "Крайний срок продления",
    );
  }
}
