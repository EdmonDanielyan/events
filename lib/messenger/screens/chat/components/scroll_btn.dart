import 'package:flutter/material.dart';

class ChatScrollBtn extends StatelessWidget {
  final void Function()? onPressed;
  const ChatScrollBtn({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 100),
      child: FloatingActionButton(
        onPressed: onPressed,
        child: Icon(Icons.keyboard_arrow_down),
      ),
    );
  }
}
