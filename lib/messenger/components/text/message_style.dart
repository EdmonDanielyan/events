import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

class MessageText extends StatelessWidget {
  final String str;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final Color? color;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final FontStyle? fontStyle;

  const MessageText (this.str, {
    Key? key,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
    this.color,
    this.textOverflow,
    this.textAlign,
    this.fontStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7
      ),
      child: Html(
        data: str,
        style: {
          '#': Style(fontSize: FontSize(fontSize ?? 13),fontWeight: fontWeight, maxLines: maxLines,color: color, textOverflow: textOverflow, textAlign: textAlign, fontStyle: fontStyle),
        },
      ),
    );
  }
}
