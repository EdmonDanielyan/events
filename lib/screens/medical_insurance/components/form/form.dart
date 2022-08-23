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
import 'package:ink_mobile/screens/service_list/service_list_page_viewer.dart';
import 'entities.dart';

class MedicalInsuranceForm extends StatefulWidget {
  final SendMedicalInsFormCubit sendMedicalInsFormCubit;
  final EdgeInsetsGeometry sectionPadding;
  final SelectfieldCubit selectfieldCubit;
  final bool isTablet;
  const MedicalInsuranceForm({
    Key? key,
    required this.sectionPadding,
    required this.sendMedicalInsFormCubit,
    required this.selectfieldCubit,
    required this.isTablet,
  }) : super(key: key);

  @override
  _MedicalInsuranceFormState createState() => _MedicalInsuranceFormState();
}

class _MedicalInsuranceFormState extends State<MedicalInsuranceForm> {
  MedicalInsuranceFormEntities entities = MedicalInsuranceFormEntities();
  final _formKey = GlobalKey<FormState>();
  CustomSectionSwitcher? tabsSwitcher;

  void setTabsSwitcher(bool isTablet) {
    setState(() {
      tabsSwitcher = CustomSectionSwitcher(tabs: [
        CustomSectionTab(
          index: 0,
          name: "policy",
          label: localizationInstance.regAppForMedIns,
          widget: MedicalInsuranceRegAppFields(
            isTablet:isTablet,
            entities: entities,
            selectfieldCubit: widget.selectfieldCubit,
          ),
        ),
        CustomSectionTab(
          index: 1,
          name: "letter",
          label: localizationInstance.extGuarantLetter,
          widget: MedicalInsuranceGuarLetFields(entities: entities, isTablet: isTablet),
        ),
      ]);
    });
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      setTabsSwitcher(widget.isTablet);
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
                    serviceSections(widget.isTablet),
                    SizedBox(height: 20),
                    _additionalText(),
                    SizedBox(height: 20),
                    btnWidget(),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          )),
    );
  }

  Widget contentWrapper({required Widget child}) {
    return Container(
      color: Colors.white,
      padding: widget.sectionPadding,
      child: child,
    );
  }

  Widget serviceSections(bool isTablet) {
    if (tabsSwitcher != null) {
      entities.type = tabsSwitcher!.tabs[tabsSwitcher!.activeIndex].name;
      return Column(
        children: [
          SwitchTabs(
            isTablet: isTablet,
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
      isTablet: widget.isTablet,
      hint: localizationInstance.medAdditionalText,
      onChanged: (val) => entities.additionalText = val,
      inputFormatters: [InputFormatters().lettersNumbersOnly],
      maxLines: 4,
    );
  }

  Widget btnWidget() {
    return BlocConsumer<SendMedicalInsFormCubit, BtnCubitState>(
      bloc: widget.sendMedicalInsFormCubit,
      listener: (BuildContext context, state) {
        if (state.state == BtnCubitStateEnums.ERROR) {
          SimpleCustomSnackbar(
            context: context,
            txt: state.message,
            duration: const Duration(seconds: 10),
          );
        }
        if (state.state == BtnCubitStateEnums.SUCCESS) {
          clearForm();
          SuccessCustomSnackbar(
            context: context,
            txt: state.message,
            duration: const Duration(seconds: 10),
          );
        }
      },
      builder: (BuildContext context, state) {
        if (state.state == BtnCubitStateEnums.SENDING) {
          return CustomCircularProgressIndicator();
        } else {
          return ServiceBtn(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final sent = await widget.sendMedicalInsFormCubit
                    .send(entities: entities);
                if (sent) {
                  ServiceListPageViewerState.pageViewer.pageController
                      .jumpToPage(0);
                }
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
