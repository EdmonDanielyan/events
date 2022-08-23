import 'package:flutter/material.dart';

class QuestionsHeader extends StatelessWidget {
  final String text;
  
  final bool isTablet;
  const QuestionsHeader( this.isTablet, {Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Text(
        text,
        style: TextStyle(fontSize: isTablet ? 21 : 17, color: Colors.grey),
      ),
    );
  }
}
