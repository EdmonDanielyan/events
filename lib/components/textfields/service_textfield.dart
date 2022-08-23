import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ink_mobile/components/textfields/required_icon.dart';

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
  final AutovalidateMode autovalidateMode;
  final bool requiredIcon;
  const ServiceTextField({
    Key? key,
    this.hint = "",
    this.controller,
    this.onChanged,
    this.validator,
    this.initialValue,
    this.requiredIcon = false,
    this.obscureText = false,
    this.keyboardType,
    this.inputFormatters = const [],
    this.autocorrect = true,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      autocorrect: autocorrect,
      maxLines: maxLines,
      validator: validator,
      autovalidateMode: autovalidateMode,
      initialValue: initialValue,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        helperStyle: TextStyle(
            fontSize: SizeConfig(context, 12).getProportionateScreenHeight),
        labelStyle: TextStyle(
            fontSize: SizeConfig(context, 12).getProportionateScreenHeight),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: SizeConfig(context, 15.0).getProportionateScreenHeight,
        ),
        errorStyle: TextStyle(
          fontSize: SizeConfig(context, 13.0).getProportionateScreenHeight,
        ),
        suffixIcon: requiredIcon ? const RequiredTextfieldIcon() : null,
        suffixIconConstraints: const BoxConstraints(maxHeight: double.infinity),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
      style: TextStyle(
        fontSize: SizeConfig(context, 15.0).getProportionateScreenHeight,
      ),
    );
  }
}
