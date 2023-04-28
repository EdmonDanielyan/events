import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:pinput/pinput.dart';

import '../../../messenger/functions/size_config.dart';

class PinCodeTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onCompleted;
  final Widget Function(String?, String)? errorBuilder;
  final FocusNode? focusNode;
  const PinCodeTextField({
    Key? key,
    this.controller,
    this.onChanged,
    this.onCompleted,
    this.errorBuilder,
    this.validator,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Pinput(
        controller: controller,
        focusNode: focusNode,
        errorBuilder: errorBuilder ??
            (str, str2) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    str ?? "",
                    style: TextStyle(
                      fontSize:
                          SizeConfig(context, 11.0).getProportionateScreenHeight,
                      color: Colors.red,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
        validator: validator,
        onChanged: onChanged,
        onCompleted: onCompleted,
        obscureText: true,
        autofocus: true,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        preFilledWidget: Text(
          "-",
          style: FontStyles.rubikP2(color: Palette.textBlack50),
        ),
      ),
    );
  }
}
