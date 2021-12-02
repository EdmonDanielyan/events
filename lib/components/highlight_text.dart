import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';

class HighlightText extends StatelessWidget {
  final String txt;
  final String highlightTxt;
  final TextStyle textStyle;
  final TextStyle highlightTextStyle;
  final TextOverflow overflow;
  final int? maxLines;
  const HighlightText({
    Key? key,
    required this.txt,
    required this.highlightTxt,
    required this.textStyle,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines,
    this.highlightTextStyle =
        const TextStyle(color: Colors.blue, fontFamily: "Helvetica"),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyRichText(
      txt,
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
