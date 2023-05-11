import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';

import '../../messenger/functions/size_config.dart';

class ServiceTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final bool autocorrect;
  final String? initialValue;
  final String? Function(String?)? validator;
  final int maxLines;
  final AutovalidateMode autoValidateMode;
  final String? descriptionText;
  FocusNode? focusNode;
  ServiceTextField({
    Key? key,
    this.hint = "",
    this.controller,
    this.onChanged,
    this.validator,
    this.initialValue,
    this.obscureText = false,
    this.keyboardType,
    this.inputFormatters = const [],
    this.autocorrect = true,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.maxLines = 1,
    this.focusNode,
    this.descriptionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    focusNode ??= FocusNode();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (descriptionText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              descriptionText!,
              style: FontStyles.rubikP1Medium(color: Palette.textBlack),
            ),
          ),
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          obscureText: obscureText,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          autocorrect: autocorrect,
          maxLines: maxLines,
          validator: validator,
          autovalidateMode: autoValidateMode,
          initialValue: initialValue,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            helperStyle: TextStyle(
                fontSize: SizeConfig(context, 12).getProportionateScreenHeight),
            labelStyle: TextStyle(
                fontSize: SizeConfig(context, 12).getProportionateScreenHeight),
            hintText: hint,
            hintStyle: FontStyles.rubikP2(color: Palette.textBlack50),
            errorStyle: TextStyle(
              fontSize: SizeConfig(context, 13.0).getProportionateScreenHeight,
            ),
            suffixIconConstraints:
                const BoxConstraints(maxHeight: double.infinity),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Palette.text20Grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Palette.greenE4A),
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Palette.text20Grey),
            ),
          ),
          style: FontStyles.rubikP2(color: Palette.textBlack),
          focusNode: focusNode,
        ),
      ],
    );
  }
}
