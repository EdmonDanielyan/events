import 'package:flutter/material.dart';

class LightTheme {
  MaterialColor primarySwatch = Colors.blue;
  String fontFamily = "Helvetica";

  getThemeData() {
    return ThemeData(
      primarySwatch: primarySwatch,
      fontFamily: fontFamily,
      primaryColor: const Color(0xff2b5e4a),
      colorScheme: ColorScheme.light(primary: const Color(0xff2b5e4a), secondary: const Color(0xFF757678)),
      iconTheme: IconThemeData(color: const Color(0xffbbbbbb)),
    );
  }
}
