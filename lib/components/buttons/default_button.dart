import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final bool isTablet;
  final Color? buttonColor;
  final Color? textColor;
  final Color? borderColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? height;
  final double? width;
  final bool enabled;
  final bool? onlyIcon;

  const DefaultButton({
    Key? key,
    required this.title,
    this.onTap,
    this.isTablet = false,
    this.buttonColor,
    this.textColor,
    this.borderColor,
    this.prefixIcon,
    this.suffixIcon,
    this.height,
    this.width,
    this.enabled = true,
    this.onlyIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(64.0),
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        decoration: BoxDecoration(
            color: buttonColor ?? Palette.transparent,
            borderRadius: BorderRadius.circular(64.0),
            border: Border.all(
              color: borderColor ?? Palette.transparent,
            )),
        child: onlyIcon == null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (prefixIcon != null) ...[
                    prefixIcon!,
                    const SizedBox(
                      width: 8.0,
                    )
                  ],
                  Text(
                    title,
                    style: FontStyles.rubikP1Medium(color: textColor),
                  ),
                  if (suffixIcon != null) ...[
                    const SizedBox(width: 8.0),
                    suffixIcon!,
                  ],
                ],
              )
            : Center(child: prefixIcon),
      ),
    );
  }
}
