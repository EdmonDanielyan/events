import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/functions/fancy_text.dart';

class AvatarFile extends StatelessWidget {
  final String url;
  final Color backgroundColor;
  final String text;
  const AvatarFile(
      {Key? key,
      this.url = "",
      this.text = "",
      this.backgroundColor = Colors.blue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.blue,
      foregroundImage: FileImage(File(url)),
      child: Text(
        FancyText(text).cutName().toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
