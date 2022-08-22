import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class ConfigText extends StatelessWidget {
  final String text;
  const ConfigText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: SizeConfig(context, 13.0).getProportionateScreenHeight,
      ),
    );
  }
}
