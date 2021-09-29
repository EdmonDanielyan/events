import 'package:flutter/material.dart';

class QuestionsHeader extends StatelessWidget {
  final String text;
  const QuestionsHeader({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 17.0, color: Colors.grey),
      ),
    );
  }
}
