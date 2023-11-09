import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/components/text/message_style.dart';

class MessageBody extends StatelessWidget {
  final String text;
  final bool isByMe;
  final double? width;
  const MessageBody(this.text, {Key? key, required this.isByMe, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MessageText(
      text,
      // колор
      // color: isByMe ? Palette.white : Palette.textBlack,
      color: isByMe ? Palette.textBlack : Palette.textBlack,
      textOverflow: TextOverflow.ellipsis,
      textAlign: TextAlign.start,
    );
  }
}
