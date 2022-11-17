import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class AuthBtn extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final bool isTablet;
  const AuthBtn({
    Key? key,
    required this.title,
    this.onTap,
    this.isTablet = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: SizeConfig(context, 17).getProportionateScreenHeight,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        minimumSize: isTablet
            ? MaterialStateProperty.all<Size>(Size(500, 75))
            : MaterialStateProperty.all<Size>(Size(335, 50)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
    );
  }
}
