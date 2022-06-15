import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/components/text/google_style.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class MessageBody extends StatelessWidget {
  final String text;
  final bool isByMe;
  const MessageBody(this.text, {Key? key, required this.isByMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GoogleText(
        text,
        color: isByMe ? Colors.white : const Color(0XFF1D2126),
        maxLines: 10,
        textOverflow: TextOverflow.ellipsis,
        fontSize: SizeConfig(context, 15).getProportionateScreenHeight,
      ),
    );
  }
}
