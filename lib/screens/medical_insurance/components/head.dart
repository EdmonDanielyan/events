import 'package:flutter/material.dart';
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

class Head extends StatelessWidget {
  final EdgeInsetsGeometry sectionPadding;

  final bool isTablet;
  const Head({Key? key, required this.isTablet, required this.sectionPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
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
        localizationInstance.medicalServiceSection,
        style: TextStyle(
          fontSize: isTablet ? 18 : 14,
          color: Colors.green[900],
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget _infoWidget() {
    return Text(
      localizationInstance.medicalInsuranceFormInfo,
      style: TextStyle(color: Colors.grey[700],   fontSize: isTablet ? 18 : 14,),
    );
  }
}
