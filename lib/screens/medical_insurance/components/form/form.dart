import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/loader/custom_circular_progress_indicator.dart';
import 'package:ink_mobile/components/snackbar/custom_snackbar.dart';
import 'package:ink_mobile/components/switch_tabs.dart';
import 'package:ink_mobile/components/textfields/service_btn.dart';
import 'package:ink_mobile/components/textfields/service_textfield.dart';
import 'package:ink_mobile/core/cubit/btn/btn_state.dart';
import 'package:ink_mobile/core/cubit/selectfield/selectfield_cubit.dart';
import 'package:ink_mobile/core/masks/input_formatters.dart';
import 'package:ink_mobile/cubit/send_medical_ins_form/send_form_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/custom_tab.dart';
import 'package:ink_mobile/screens/medical_insurance/components/form/guar_let_fields.dart';
import 'package:ink_mobile/screens/medical_insurance/components/form/reg_app_fields.dart';
import 'package:ink_mobile/screens/medical_insurance/components/form/user_fields.dart';
import 'entities.dart';

class MedicalInsuranceForm extends StatefulWidget {
  final SendMedicalInsFormCubit sendMedicalInsFormCubit;
  final EdgeInsetsGeometry sectionPadding;
  final SelectfieldCubit selectfieldCubit;
  const MedicalInsuranceForm({
    Key? key,
    required this.sectionPadding,
    required this.sendMedicalInsFormCubit,
    required this.selectfieldCubit,
  }) : super(key: key);

  @override
  _MedicalInsuranceFormState createState() => _MedicalInsuranceFormState();
}

class _MedicalInsuranceFormState extends State<MedicalInsuranceForm> {
  MedicalInsuranceFormEntities entities = MedicalInsuranceFormEntities();
  final _formKey = GlobalKey<FormState>();
  CustomSectionSwitcher? tabsSwitcher;

  void setTabsSwitcher() {
    setState(() {
      tabsSwitcher = CustomSectionSwitcher(tabs: [
        CustomSectionTab(
          index: 0,
          name: "policy",
          label: localizationInstance.regAppForMedIns,
          widget: MedicalInsuranceRegAppFields(
            entities: entities,
            selectfieldCubit: widget.selectfieldCubit,
          ),
        ),
        CustomSectionTab(
          index: 1,
          name: "letter",
          label: localizationInstance.extGuarantLetter,
          widget: MedicalInsuranceGuarLetFields(entities: entities),
        ),
      ]);
    });
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      setTabsSwitcher();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            contentWrapper(
              child: MedicalInsuranceFormUserFields(entities: entities),
            ),
            Divider(color: Colors.grey, height: 2.0),
            SizedBox(height: 25.0),
            contentWrapper(
              child: Column(
                children: [
                  serviceSections(),
                  SizedBox(height: 20),
                  _additionalText(),
                  SizedBox(height: 20),
                  btnWidget(),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget contentWrapper({required Widget child}) {
    return Container(
      color: Colors.white,
      padding: widget.sectionPadding,
      child: child,
    );
  }

  Widget serviceSections() {
    if (tabsSwitcher != null) {
      entities.type = tabsSwitcher!.tabs[tabsSwitcher!.activeIndex].name;
      return Column(
        children: [
          SwitchTabs(
            activeIndex: tabsSwitcher!.activeIndex,
            onIndexChanged: (index) {
              setState(() {
                tabsSwitcher!.activeIndex = index;
              });
            },
            tabs: tabsSwitcher!.tabs,
          ),
          SizedBox(height: 20),
          tabsSwitcher!.tabs[tabsSwitcher!.activeIndex].widget,
        ],
      );
    }
    return SizedBox();
  }

  Widget _additionalText() {
    return ServiceTextField(
      hint: localizationInstance.medAdditionalText,
      onChanged: (val) => entities.additionalText = val,
      inputFormatters: [InputFormatters.lettersNumbersOnly],
      maxLines: 4,
    );
  }

  Widget btnWidget() {
    return BlocConsumer<SendMedicalInsFormCubit, BtnCubitState>(
      bloc: widget.sendMedicalInsFormCubit,
      listener: (BuildContext context, state) {
        if (state.state == BtnCubitStateEnums.ERROR) {
          SimpleCustomSnackbar(context: context, txt: state.message);
        }
        if (state.state == BtnCubitStateEnums.SUCCESS) {
          clearForm();
          SuccessCustomSnackbar(
            context: context,
            txt: state.message,
            duration: Duration(seconds: 3),
          );
        }
      },
      builder: (BuildContext context, state) {
        if (state.state == BtnCubitStateEnums.SENDING) {
          return CustomCircularProgressIndicator();
        } else {
          return ServiceBtn(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.sendMedicalInsFormCubit.send(entities: entities);
              }
            },
            txt: localizationInstance.submit,
          );
        }
      },
    );
  }

  void clearForm() {
    _formKey.currentState!.reset();
    widget.selectfieldCubit.clear();
  }
}
