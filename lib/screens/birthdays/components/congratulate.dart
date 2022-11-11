import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/aseets.dart';
import '../../../localization/i18n/i18n.dart';
import '../../../messenger/functions/size_config.dart';

class BirthdayCongratulate extends StatelessWidget {
  final void Function()? onTap;
  const BirthdayCongratulate({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(9.0),
        margin: const EdgeInsets.only(right: 1.0),
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            SizedBox(
              width: SizeConfig(context, 35).getProportionateScreenHeight,
              height: SizeConfig(context, 32.0).getProportionateScreenHeight,
              child: SvgPicture.asset(GIFT_ICON_SVG, color: Colors.white),
            ),
            const SizedBox(height: 3.0),
            Text(
              localizationInstance.congratulate,
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig(context, 10).getProportionateScreenHeight,
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
