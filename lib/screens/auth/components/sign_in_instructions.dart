import 'package:flutter/material.dart';
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

class SignInInstructions extends StatelessWidget {
  final Color txtColor;
  const SignInInstructions({Key? key, this.txtColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        launchUrl(
            'https://portal.irkutskoil.ru/login/Инструкция по регистрации на ИНК портале.pdf');
      },
      child: Opacity(
        opacity: 0.6,
        child: Text(
          localizationInstance.signInInstructions,
          style: TextStyle(
            color: txtColor,
            fontSize: 14,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
