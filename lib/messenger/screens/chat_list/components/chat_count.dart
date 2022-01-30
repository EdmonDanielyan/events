import 'package:flutter/material.dart';

class ChatCount extends StatelessWidget {
  final int count;
  const ChatCount({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.5, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Text(
        "$count",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 12.0),
      ),
    );
  }
}
