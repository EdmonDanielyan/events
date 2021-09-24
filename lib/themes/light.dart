import 'package:flutter/material.dart';

class LightTheme {
  MaterialColor primarySwatch = Colors.blue;
  String fontFamily = "Helvetica";

  getThemeData() {
    return ThemeData(
      primarySwatch: primarySwatch,
      fontFamily: fontFamily,
      primaryColor: Color(0xff2b5e4a),
      accentColor: Color(0xFF757678),
      iconTheme: IconThemeData(color: Color(0xffbbbbbb)),
    );
  }
}
