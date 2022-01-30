import 'package:flutter/material.dart';

class MessageCardAction extends StatelessWidget {
  final String text;
  const MessageCardAction({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 2.0, bottom: 2.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
