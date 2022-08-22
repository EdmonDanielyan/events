import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class QuestionsHeader extends StatelessWidget {
  final String text;
  const QuestionsHeader({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: SizeConfig(context, 15.0).getProportionateScreenHeight,
          color: Colors.grey,
        ),
      ),
    );
  }
}
