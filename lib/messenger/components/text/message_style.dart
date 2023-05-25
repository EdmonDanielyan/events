import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/functions/launch_url.dart';

class MessageText extends StatelessWidget {
  final String str;
  final Color? color;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;

  const MessageText (this.str, {
    Key? key,
    this.color,
    this.textOverflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.start,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Html(
        shrinkWrap: true,
        data: str.replaceAll("[B]", "").replaceAll("[/B]", ""),
        onLinkTap: (_url ,con,__,___){
          launchUrl(_url!,context: context);
        },
        style: {
          '#': Style.fromTextStyle(FontStyles.rubikP2(color: color)),
        },
      ),
    );
  }
}
