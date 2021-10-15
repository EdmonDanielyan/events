import 'package:flutter/material.dart';

class MessageSendBtn extends StatelessWidget {
  final Function()? onPressed;
  const MessageSendBtn({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFF46966E),
          borderRadius: BorderRadius.circular(50),
        ),
        child: IconButton(
          icon: Icon(Icons.send_rounded),
          onPressed: onPressed,
          color: Colors.white,
        ),
      ),
    );
  }
}
