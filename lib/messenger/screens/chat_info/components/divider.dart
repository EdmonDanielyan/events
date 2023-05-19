import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/palette.dart';

class ChatInfoDivider extends StatelessWidget {
  const ChatInfoDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1.0,
      thickness: 1.0,
      color: Palette.text20Grey,
    );
  }
}
