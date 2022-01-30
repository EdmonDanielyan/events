import 'package:flutter/material.dart';

class ChatDivider extends StatelessWidget {
  const ChatDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey[700],
      height: 0,
    );
  }
}
