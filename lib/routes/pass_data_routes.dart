import 'package:flutter/material.dart';
import 'package:ink_mobile/screens/set_pin_code/set_pin_code_screen.dart';

class PassDataRoutes {
  static void setPin(BuildContext context,
      {required void Function(BuildContext)? onComplete}) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => SetPinCodeScreen(onComplete: onComplete)),
        (route) => false);
  }
}
