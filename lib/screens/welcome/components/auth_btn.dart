import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final bool isTablet;
  final Color? buttonColor;
  final Color? textColor;
  final Color? borderColor;
  const DefaultButton({
    Key? key,
    required this.title,
    this.onTap,
    this.isTablet = false,
    this.buttonColor,
    this.textColor,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: FontStyles.rubikP1Medium(color: textColor),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(buttonColor ?? Palette.white),
        minimumSize: isTablet
            ? MaterialStateProperty.all<Size>(Size(500, 75))
            : MaterialStateProperty.all<Size>(Size(335, 50)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
            side: BorderSide(
              color: borderColor ?? Palette.transparent,
            )
          ),
        ),
      ),
    );
  }
}
