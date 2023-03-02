import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/palette.dart';

class ChatDivider extends StatelessWidget {
  const ChatDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1.0,
      thickness: 1,
      color: Palette.text20Grey,
    );
  }
}
