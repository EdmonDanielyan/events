import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/components/text/google_style.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class MenuItem extends StatelessWidget {
  final String value;
  final Widget icon;
  const MenuItem({
    Key? key,
    required this.value,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 10.0),
        Expanded(
          child: GoogleText(
            value,
            maxLines: 1,
            fontSize: SizeConfig(context, 12.0).getProportionateScreenHeight,
          ),
        ),
      ],
    );
  }
}
