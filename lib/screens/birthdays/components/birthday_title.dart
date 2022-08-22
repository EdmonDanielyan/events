import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class BirthdayTitle extends StatelessWidget {
  final String str;
  const BirthdayTitle(this.str, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      child: Text(
        str.toUpperCase(),
        style: TextStyle(
          color: Theme.of(context).iconTheme.color,
          fontWeight: FontWeight.bold,
          fontSize: SizeConfig(context, 16.0).getProportionateScreenHeight,
        ),
      ),
    );
  }
}
