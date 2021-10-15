import 'package:flutter/material.dart';

class MessageSearchBtn extends StatelessWidget {
  final void Function()? onPressed;
  const MessageSearchBtn({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.search,
        size: 28,
      ),
    );
  }
}
