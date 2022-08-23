import 'package:flutter/material.dart';

class FeedbackHintText extends StatelessWidget {
  final String txt;
  final bool isTablet;
  const FeedbackHintText({Key? key, required this.txt, required this.isTablet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: isTablet? 16 : 12.0,
        color: Colors.grey,
      ),
    );
  }
}
