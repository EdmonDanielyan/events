import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/components/text/google_style.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class ChatInfoHeader extends StatelessWidget {
  final String title;
  const ChatInfoHeader(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleText(
      title,
      maxLines: 1,
      fontWeight: FontWeight.w700,
      fontSize: SizeConfig(context, 11).getProportionateScreenHeight,
      color: const Color(0XFFBBBBBB),
    );
  }
}
