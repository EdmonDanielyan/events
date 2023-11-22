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
    return SizedBox(
      width: size.width,
      // margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          disabledForegroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 13.0),
          shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Colors.grey,
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(50)),
        ),
        child: Text(
          txt,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig(context, 16.0).getProportionateScreenHeight),
        ),
      ),
    );
  }
}
