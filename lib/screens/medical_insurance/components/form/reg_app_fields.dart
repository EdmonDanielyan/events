import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ink_mobile/components/date_input_field.dart';
import 'package:ink_mobile/components/textfields/service_selectfield_cubit.dart';
import 'package:ink_mobile/components/textfields/service_textfield.dart';
import 'package:ink_mobile/core/cubit/selectfield/selectfield_cubit.dart';
import 'package:ink_mobile/core/lists/medical_services.dart';
import 'package:ink_mobile/core/masks/input_formatters.dart';
import 'package:ink_mobile/core/validator/field_validator.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/messenger/utils/date_functions.dart';
import 'package:ink_mobile/models/selectfield.dart';
import 'package:ink_mobile/screens/medical_insurance/components/form/entities.dart';

class MedicalInsuranceRegAppFields extends StatelessWidget {
  final MedicalInsuranceFormEntities entities;
  final SelectfieldCubit selectfieldCubit;

  const MedicalInsuranceRegAppFields({
    Key? key,
    required this.entities,
    required this.selectfieldCubit,
  }) : super(key: key);
  static late AppLocalizations _strings;
  static late MedicalServicesList _medicalServicesList;
  static late List<Selectfield> _servicesList;

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    _medicalServicesList = MedicalServicesList();
    _servicesList = _medicalServicesList.getList();

    return Column(
      children: [
        Text(
          _strings.regAppForMedInsDesc,
          style: TextStyle(
            fontSize: SizeConfig(context, 13).getProportionateScreenHeight,
          ),
        ),
        SizedBox(height: 20),
        _selectService(context),
        SizedBox(height: 20),
        _hospitalName(),
        SizedBox(height: 20),
        _city(),
        SizedBox(height: 20),
        _address(),
        SizedBox(height: 20),
        _price(),
        SizedBox(height: 20),
        _dateStart(context),
      ],
    );
  }

  Widget _selectService(BuildContext context) {
    return ServiceSelectFieldCubit(
      hint: _strings.chooseService,
      cubit: selectfieldCubit,
      subWidget: subWidget,
      items: _servicesList,
      validator: (_) =>
          entities.services.length < 1 ? _strings.fillTheField : null,
      onChanged: (val) => entities.services = val,
    );
  }

  Widget subWidget(Selectfield item, bool checked) {
    if (checked && item.subWidget) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ServiceTextField(
          initialValue: item.description,
          hint: _strings.clarification,
          onChanged: (val) {
            for (var item2 in _servicesList)
              if (item2.title == item.title) item.description = val;
          },
          maxLines: 2,
        ),
      );
    }

    return SizedBox();
  }

  Widget _hospitalName() {
    return ServiceTextField(
      hint: _strings.hospitalName,
      requiredIcon: true,
      validator: (val) => val!.length < 1 ? _strings.fillTheField : null,
      inputFormatters: [InputFormatters().lettersNumbersOnly],
      onChanged: (val) => entities.hospitalName = val,
    );
  }

  Widget _city() {
    return ServiceTextField(
      hint: _strings.city,
      requiredIcon: true,
      keyboardType: TextInputType.streetAddress,
      validator: (val) => FieldValidator(_strings).cityValidator(val),
      onChanged: (val) => entities.city = val,
    );
  }

  Widget _address() {
    return ServiceTextField(
      hint: _strings.address,
      requiredIcon: true,
      keyboardType: TextInputType.streetAddress,
      validator: (val) => FieldValidator(_strings).streetValidator(val),
      onChanged: (val) => entities.address = val,
    );
  }

  Widget _price() {
    return ServiceTextField(
      hint: _strings.medicalPrice,
      requiredIcon: true,
      validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      onChanged: (val) => entities.price = val,
    );
  }

  Widget _dateStart(BuildContext context) {
    return DateInputField(
      controller: TextEditingController(),
      title: _strings.medicalDateStart,
      validator: (val) => val == null ? _strings.fillTheField : null,
      onChanged: (val) {
        entities.dateStart =
            DateFunctions(passedDate: val).dayMonthYearNumbers();
      },
    );
  }
}
