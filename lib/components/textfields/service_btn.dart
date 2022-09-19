import 'package:flutter/material.dart';

import '../../messenger/functions/size_config.dart';

class ServiceBtn extends StatelessWidget {
  final void Function()? onPressed;
  final String txt;
  const ServiceBtn({Key? key, required this.onPressed, required this.txt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          txt,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: SizeConfig(context, 16.0).getProportionateScreenHeight,
          ),
        ),
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          disabledForegroundColor: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 13.0),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.grey,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
