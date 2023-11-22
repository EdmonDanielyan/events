import 'package:flutter/material.dart';

class LightTheme {
  MaterialColor primarySwatch = Colors.blue;
  String fontFamily = "Helvetica";

  getThemeData() {
    return ThemeData(
      primarySwatch: primarySwatch,
      fontFamily: fontFamily,
      primaryColor: const Color(0xff2b5e4a),
      colorScheme: const ColorScheme.light(
          primary: Color(0xff2b5e4a), secondary: Color(0xFF757678)),
      iconTheme: const IconThemeData(color: Color(0xffbbbbbb)),
    );
  }
}
