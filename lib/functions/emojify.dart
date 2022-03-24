import 'package:flutter_emoji/flutter_emoji.dart';

class Emojify {
  final String str;
  final EmojiParser parser = EmojiParser();

  Emojify(this.str);

  String get unEmojify => parser.unemojify(str);
  String get emojify => parser.emojify(str);

  String get replaceUnsupported {
    var newStr = unEmojify;

    newStr = newStr.replaceAll(":relaxed:", ":blush:");
    newStr =
        newStr.replaceAll(":white_frowning_face:", ":slightly_frowning_face:");

    return parser.emojify(newStr);
  }
}
