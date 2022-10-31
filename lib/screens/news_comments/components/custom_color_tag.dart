import 'package:flutter/material.dart';
import 'package:flutter_bbcode/tags/tag_parser.dart';

class CustomColorTag extends StyleTag {
  CustomColorTag() : super('color');

  TextStyle transformStyle(
      TextStyle oldStyle, Map<String, String>? attributes) {
    final String stringColor =
        attributes!.values.first.toString().toLowerCase().trim();
    HexColor? actualColor;
    try {
      actualColor = HexColor(stringColor);
    } catch (e) {}

    if (actualColor is HexColor) {
      return oldStyle.copyWith(color: actualColor);
    } else if (wordToColor.containsKey(stringColor)) {
      return oldStyle.copyWith(color: wordToColor[stringColor]);
    } else {
      return oldStyle;
    }
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

final wordToColor = <String, Color>{
  'black': Colors.black,
  'white': Colors.white,
  'red': Colors.red,
  'green': Colors.green,
  'blue': Colors.blue,
  'purple': Colors.purple,
  'firebrick': Color(0xFFb22222),
  'maroon': Color(0xFF800000),
  'orangered': Color(0xffff4500),
  'midnightblue': Color(0xFF191970),
  'cornflowerblue': Color(0xFF6495ED),
  'cyan': Color(0xFF00FFFF),
  'yellow': Colors.yellow,
  'magenta': Color(0xFFFF00FF),
  'darkgreen': Color(0xFF023020),
  'darkgoldenrod': Color(0xFFb8860b),
  'gold': Color(0xFFFFD700),
  'orchid': Color(0xFFda70d6),
  'blueviolet': Color(0xFF8a2be2),
  'burlywood': Color(0xFFdeb887),
  'peachpuff': Color(0xFFffdab9),
};
