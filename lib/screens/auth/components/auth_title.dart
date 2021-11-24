import 'package:flutter/material.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

class AuthTitle extends StatelessWidget {
  const AuthTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      localizationInstance.signIn,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
