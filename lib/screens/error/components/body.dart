import 'package:flutter/material.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/screens/error/components/background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Container(
        child: Column(
          children: [
            Text(
              '404',
              style: TextStyle(
                  fontSize:
                      SizeConfig(context, 100).getProportionateScreenHeight,
                  fontWeight: FontWeight.w800,
                  color: Colors.white.withOpacity(0.5),
                  fontFamily: "Helvetica"),
              textAlign: TextAlign.center,
            ),
            Text(
              localizationInstance.pageNotFound,
              style: TextStyle(
                fontSize: SizeConfig(context, 21).getProportionateScreenHeight,
                color: Colors.white,
                fontFamily: "Helvetica",
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    ));
  }
}
