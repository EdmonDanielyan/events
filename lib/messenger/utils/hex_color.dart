import 'package:flutter/material.dart';

class HexColor extends Color {
  HexColor(final String hexColor, final int onErrorValue)
      : super(_strHexToInt(hexColor, onErrorValue));
}

int _strHexToInt(String hexColor, int onErrorValue) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor";
  }
  return int.tryParse(hexColor, radix: 16) ?? onErrorValue;
}
