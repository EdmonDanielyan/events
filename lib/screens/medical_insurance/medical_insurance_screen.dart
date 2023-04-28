import 'package:flutter/material.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/core/cubit/selectfield/selectfield_cubit.dart';
import 'package:ink_mobile/cubit/send_medical_ins_form/send_form_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/medical_insurance/components/head.dart';

import 'components/form/form.dart';

class MedicalInsuranceScreen extends StatefulWidget {
  final SendMedicalInsFormCubit sendMedicalInsFormCubit;
  final SelectfieldCubit selectFieldCubit;
  final PreferredSizeWidget? appBar;
  const MedicalInsuranceScreen({
    Key? key,
    this.appBar,
    required this.sendMedicalInsFormCubit,
    required this.selectFieldCubit,
  }) : super(key: key);

  @override
  _MedicalInsuranceScreenState createState() => _MedicalInsuranceScreenState();
}

class _MedicalInsuranceScreenState extends State<MedicalInsuranceScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final _strings = localizationInstance;

    return Scaffold(
      appBar: widget.appBar ??
          InkAppBar(context, title: _strings.getMedicalInsurance),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Head(),
            MedicalInsuranceForm(
              sendMedicalInsFormCubit: widget.sendMedicalInsFormCubit,
              selectFieldCubit: widget.selectFieldCubit,
            ),
          ],
        ),
      ),
      backgroundColor: Palette.white,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
