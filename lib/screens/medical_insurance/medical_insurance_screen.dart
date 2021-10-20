import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/core/cubit/selectfield/selectfield_cubit.dart';
import 'package:ink_mobile/cubit/send_medical_ins_form/send_form_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/medical_insurance/components/head.dart';
import 'package:ink_mobile/setup.dart';

import 'components/form/form.dart';

class MedicalInsuranceScreen extends StatefulWidget {
  final PreferredSizeWidget? appBar;
  const MedicalInsuranceScreen({Key? key, this.appBar}) : super(key: key);

  @override
  _MedicalInsuranceScreenState createState() => _MedicalInsuranceScreenState();
}

class _MedicalInsuranceScreenState extends State<MedicalInsuranceScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final _strings = localizationInstance;
    EdgeInsetsGeometry sectionPadding =
        const EdgeInsets.symmetric(horizontal: 25, vertical: 20.0);

    return Scaffold(
      appBar: widget.appBar ??
          InkAppBarWithText(title: _strings.getMedicalInsurance),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Head(sectionPadding: sectionPadding),
              Divider(color: Colors.grey, height: 2.0),
              SizedBox(height: 25.0),
              MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => sl.get<SendMedicalInsFormCubit>(),
                  ),
                  BlocProvider(create: (context) => SelectfieldCubit()),
                ],
                child: MedicalInsuranceForm(sectionPadding: sectionPadding),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
