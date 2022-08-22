import 'package:flutter/material.dart';
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

class SignInInstructions extends StatelessWidget {
  final Color txtColor;
  final String? txt;
  final String? link;
  final bool isTablet;
  const SignInInstructions({
    Key? key,
    this.txtColor = Colors.white,
    this.txt,
    this.link,
    required this.isTablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchUrl(
          link ??
              'https://portal.irkutskoil.ru/login/%D0%98%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%86%D0%B8%D1%8F%20%D0%BF%D0%BE%20%D1%80%D0%B5%D0%B3%D0%B8%D1%81%D1%82%D1%80%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BD%D0%B0%20%D0%98%D0%9D%D0%9A%20%D0%BF%D0%BE%D1%80%D1%82%D0%B0%D0%BB%D0%B5.pdf',
          formatUrl: false,
        );
      },
      child: Opacity(
        opacity: 0.6,
        child: Text(
          txt ?? localizationInstance.signInInstructions,
          style: TextStyle(
            color: txtColor,
            fontSize: isTablet ? 18 : 14,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
