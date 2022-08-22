import 'package:flutter/material.dart';
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class Head extends StatelessWidget {
  final EdgeInsetsGeometry sectionPadding;
  const Head({Key? key, required this.sectionPadding}) : super(key: key);

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
              style: TextStyle(
                fontSize:
                    SizeConfig(context, 27.0).getProportionateScreenHeight,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          _medicalServiceLinkWidget(context),
          SizedBox(height: 12.0),
          _infoWidget(context),
          // SizedBox(height: 5.0),
          // _sampleWidget(),
        ],
      ),
    );
  }

  Widget _medicalServiceLinkWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        launchUrl("https://portal.irkutskoil.ru/medicine/");
      },
      child: Text(
        localizationInstance.medicalServiceSection,
        style: TextStyle(
          fontSize: SizeConfig(context, 13.0).getProportionateScreenHeight,
          color: Colors.green[900],
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget _infoWidget(BuildContext context) {
    return Text(
      localizationInstance.medicalInsuranceFormInfo,
      style: TextStyle(
        fontSize: SizeConfig(context, 13.0).getProportionateScreenHeight,
        color: Colors.grey[700],
      ),
    );
  }
}
