import 'package:flutter/material.dart';

import '../../../messenger/functions/size_config.dart';

class FeedbackHintText extends StatelessWidget {
  final String txt;
  const FeedbackHintText({Key? key, required this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: SizeConfig(context, 10.0).getProportionateScreenHeight,
        color: Colors.grey,
      ),
    );
  }
}
