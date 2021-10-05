import 'package:flutter/material.dart';

class MessageSendBtn extends StatelessWidget {
  const MessageSendBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green[800],
          borderRadius: BorderRadius.circular(50),
        ),
        child: IconButton(
          icon: Icon(Icons.send_rounded),
          onPressed: () {},
          color: Colors.white,
        ),
      ),
    );
  }
}
