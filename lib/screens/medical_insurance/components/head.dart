import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/localization/strings/language.dart';

class Head extends StatelessWidget {
  final EdgeInsetsGeometry sectionPadding;
  const Head({Key? key, required this.sectionPadding}) : super(key: key);

  static late LanguageStrings _strings;

  @override
  Widget build(BuildContext context) {
    _strings = BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    return Container(
      color: Colors.white,
      padding: sectionPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              _strings.getMedicalInsurance,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 8.0),
          _medicalServiceLinkWidget(),
          SizedBox(height: 12.0),
          _infoWidget(),
          // SizedBox(height: 5.0),
          // _sampleWidget(),
        ],
      ),
    );
  }

  Widget _medicalServiceLinkWidget() {
    return InkWell(
      onTap: () {
        launchUrl("https://portal.irkutskoil.ru/medicine/");
      },
      child: Text(
        _strings.medicalServiceSection,
        style: TextStyle(
          color: Colors.green[900],
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget _infoWidget() {
    return Text(
      _strings.medicalInsuranceFormInfo,
      style: TextStyle(color: Colors.grey[700]),
    );
  }

  Widget _sampleWidget() {
    return InkWell(
      onTap: () {
        launchUrl("https://portal.irkutskoil.ru/services/dms/help.jpg");
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.info, color: Colors.blue),
          SizedBox(width: 7.0),
          Text(
            _strings.formFillingSample,
            style: TextStyle(color: Colors.blue),
          )
        ],
      ),
    );
  }
}
