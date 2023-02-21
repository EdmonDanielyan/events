import 'package:flutter/material.dart';
import 'package:flutter_bbcode/flutter_bbcode.dart';

import 'package:ink_mobile/messenger/utils/hex_color.dart';
import 'package:ink_mobile/messenger/utils/word_to_color_map.dart';

class CustomColorTag extends StyleTag {
  final Color defaultColor;
  CustomColorTag({required this.defaultColor}) : super('color');

  TextStyle transformStyle(
      TextStyle oldStyle, Map<String, String>? attributes) {
    if (attributes != null && attributes.isNotEmpty) {
      final String stringColor = attributes.values.first.toLowerCase().trim();
      HexColor actualColor = HexColor(stringColor, defaultColor.value);

      if (wordToColor.containsKey(stringColor)) {
        return oldStyle.copyWith(color: wordToColor[stringColor]);
      } else if (actualColor.value != defaultColor.value) {
        return oldStyle.copyWith(color: actualColor);
      } else {
        return oldStyle;
      }
    } else {
      return oldStyle;
    }
  }
}
