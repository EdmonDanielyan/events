import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bbcode/flutter_bbcode.dart';


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
      child:
      // BBCodeText(
      //   data: str,
      //   stylesheet: defaultBBStylesheet(
      //     textStyle: TextStyle(fontStyle: fontStyle ,fontWeight: fontWeight, color: color, overflow: textOverflow, fontSize: fontSize),
      //   ).replaceTag(UrlTag(onTap: (url){
      //     launchUrl(Uri.parse(url));
      //   })),
      // )

      Html(
        shrinkWrap: true,
        data: str.replaceAll("[B]", "").replaceAll("[/B]", ""),
        onLinkTap: (_url ,context,__,___){
          Uri url = Uri.parse(_url!);
          launchUrl(url);
        },
        style: {
          '#': Style(fontSize: FontSize(fontSize ?? 13),fontWeight: fontWeight, maxLines: maxLines,color: color, textOverflow: textOverflow, textAlign: textAlign, fontStyle: fontStyle),
        },
      ),
    );
  }
}
