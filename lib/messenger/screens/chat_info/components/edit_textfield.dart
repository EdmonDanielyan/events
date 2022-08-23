import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../functions/size_config.dart';

class ChatEditTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String? initialValue;
  final void Function(String)? onChanged;
  final String? hintText;
  final FontWeight? fontWeight;
  final TextEditingController? controller;
  const ChatEditTextField({
    Key? key,
    this.validator,
    this.initialValue,
    this.onChanged,
    this.hintText,
    this.fontWeight,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      initialValue: initialValue,
      validator: validator,
      textCapitalization: TextCapitalization.sentences,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          errorStyle: TextStyle(
            fontSize: SizeConfig(context, 13).getProportionateScreenHeight,
          )),
      style: GoogleFonts.roboto(
        fontSize: SizeConfig(context, 12).getProportionateScreenHeight,
        fontWeight: fontWeight,
        color: Colors.black,
      ),
    );
  }
}
