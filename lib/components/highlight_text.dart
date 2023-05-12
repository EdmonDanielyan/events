import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:remove_emoji/remove_emoji.dart';

class HighlightText extends StatelessWidget {
  final String txt;
  final String highlightTxt;
  final TextStyle textStyle;
  final TextStyle highlightTextStyle;
  final TextOverflow overflow;
  final int? maxLines;
  final bool showRegularIfEmpty;
  const HighlightText({
    Key? key,
    required this.txt,
    required this.highlightTxt,
    required this.textStyle,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines,
    this.highlightTextStyle =
        const TextStyle(color: Colors.blue, fontFamily: "Noto"),
    this.showRegularIfEmpty = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (showRegularIfEmpty && highlightTxt.isEmpty) {
      return Text(
        txt,
        style: textStyle,
        overflow: overflow,
        maxLines: maxLines,
      );
    } else {
      return EasyRichText(
        txt.removEmoji,
        caseSensitive: false,
        defaultStyle: textStyle,
        overflow: overflow,
        maxLines: maxLines,
        patternList: [
          EasyRichTextPattern(
            targetString: RegExp.escape(highlightTxt),
            style: highlightTextStyle,
          ),
        ],
      );
    }
  }
}
