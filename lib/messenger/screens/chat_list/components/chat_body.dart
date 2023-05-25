import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';

class ChatBody extends StatelessWidget {
  final String body;
  final String title;
  final String highlightValue;
  const ChatBody(
    this.body, {
    Key? key,
    this.title = "",
    this.highlightValue = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      text: TextSpan(
        children: [
          TextSpan(
            text: "$title ",
            style: FontStyles.rubikP2(color: Palette.greenE4A),
          ),
          TextSpan(
            text: body,
            style: FontStyles.rubikP2(color: Palette.textBlack50),
          ),
        ],
      ),
    );
  }
}
