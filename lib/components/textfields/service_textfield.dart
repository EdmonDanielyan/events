import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ink_mobile/components/textfields/required_icon.dart';

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
  
  final bool isTablet;
  const ServiceTextField({
    
    Key? key,
    this.isTablet = false,
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
      style: TextStyle(fontSize: isTablet ? 18 : 14),
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
        helperStyle:  TextStyle(fontSize: isTablet ? 20 : 14) ,
        labelStyle: TextStyle(fontSize: isTablet ? 20 : 14) ,
        errorStyle:TextStyle(fontSize: isTablet ? 18 : 12) ,
        hintStyle: TextStyle(fontSize: isTablet ? 20 : 14),
        hintText: hint,
        suffixIcon: requiredIcon ? const RequiredTextfieldIcon() : null,
        suffixIconConstraints: const BoxConstraints(maxHeight: double.infinity),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
