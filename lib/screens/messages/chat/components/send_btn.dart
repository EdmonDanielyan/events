import 'package:flutter/material.dart';

class MessageSendBtn extends StatelessWidget {
  final Function()? onPressed;
  final Widget icon;
  const MessageSendBtn({Key? key, required this.onPressed, this.icon = const Icon(Icons.send_rounded)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0XFF46966E),
          borderRadius: BorderRadius.circular(50),
        ),
        child: IconButton(
          icon: icon,
          onPressed: onPressed,
          color: Colors.white,
        ),
      ),
    );
  }
}
