import 'package:flutter/material.dart';
import 'package:flutter_bbcode/tags/tag_parser.dart';
import 'package:ink_mobile/messenger/utils/hex_color.dart';
import 'package:ink_mobile/messenger/utils/word_to_color_map.dart';

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


