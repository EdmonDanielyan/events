import 'package:flutter/material.dart';

class FeedbackHintText extends StatelessWidget {
  final String txt;
  const FeedbackHintText({Key? key, required this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: 12.0,
        color: Colors.grey,
      ),
    );
  }
}
