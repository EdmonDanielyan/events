import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/components/text/google_style.dart';
import 'package:ink_mobile/messenger/functions/fancy_text.dart';
import 'package:remove_emoji/remove_emoji.dart';

class AvatarPlaceholder extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  const AvatarPlaceholder(
      {Key? key, this.text = "", this.backgroundColor = Colors.blue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.blue,
      foregroundImage: null,
      child: GoogleText(
        FancyText(RemoveEmoji().clean(text)).cutName().toUpperCase(),
        color: Colors.white,
      ),
    );
  }
}
