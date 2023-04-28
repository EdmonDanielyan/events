import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class Head extends StatelessWidget {
  const Head({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 32.0, bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _strings.getMedicalInsurance,
            style: FontStyles.rubikH2(color: Palette.textBlack),
          ),
          const SizedBox(height: 8.0),
          _medicalServiceLinkWidget(context),
          const SizedBox(height: 12.0),
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
        style: FontStyles.rubikP1Medium(color: Palette.greenE4A, decoration: TextDecoration.underline),
      ),
    );
  }

  Widget _infoWidget(BuildContext context) {
    return Text(
      localizationInstance.medicalInsuranceFormInfo,
      style: FontStyles.rubikP2(color: Palette.textBlack50),
    );
  }
}
