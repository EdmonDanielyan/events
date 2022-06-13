import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/components/text/google_style.dart';

class ChatInfoBtn extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final Color? color;
  final EdgeInsets? padding;
  const ChatInfoBtn({
    Key? key,
    required this.title,
    this.onPressed,
    this.color,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Container(
        padding: padding,
        child: GoogleText(
          title,
          maxLines: 1,
          color: color,
          fontSize: 16.0,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
