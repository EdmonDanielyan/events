//comment after refactoring, because it dont use
// import 'dart:io';

// import 'package:flutter_emoji/flutter_emoji.dart';

// class Emojify {
//   final String str;
//   final EmojiParser parser = EmojiParser();

//   Emojify(this.str);

//   String get unEmojify => parser.unemojify(str);
//   String get emojify => parser.emojify(str);

//   String get replaceUnsupported {
//     var newStr = replaceUnsupportedEmojis(unEmojify);

//     return parser.emojify(newStr);
//   }

//   String replaceUnsupportedEmojis(String str) {
//     str = str.replaceAll(":relaxed:", ":blush:");
//     str = str.replaceAll(":white_frowning_face:", ":slightly_frowning_face:");
//     str = replaceNumbers(str);
//     return str;
//   }

//   String replaceNumbers(String str) {
//     if (Platform.isIOS) {
//       str = str.replaceAll(":hash:", "#");
//       str = str.replaceAll(":zero:", "0");
//       str = str.replaceAll(":one:", "1");
//       str = str.replaceAll(":two:", "2");
//       str = str.replaceAll(":three:", "3");
//       str = str.replaceAll(":four:", "4");
//       str = str.replaceAll(":five:", "5");
//       str = str.replaceAll(":six:", "6");
//       str = str.replaceAll(":seven:", "7");
//       str = str.replaceAll(":eight:", "8");
//       str = str.replaceAll(":nine:", "9");
//       str = str.replaceAll(":keycap_ten:", "10");
//     }

//     return str;
//   }
// }
