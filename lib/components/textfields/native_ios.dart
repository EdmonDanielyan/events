import 'package:flutter/material.dart';
import 'package:flutter_native_text_input/flutter_native_text_input.dart';

class NativeIosTextfield extends StatelessWidget {
  final void Function(String)? onChanged;
  final String? hint;
  final BorderRadius? borderRadius;
  final int maxLines;
  final int minLines;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final EdgeInsets? contentPadding;
  final Color? fillColor;
  final TextCapitalization textCapitalization;
  const NativeIosTextfield({
    Key? key,
    required this.onChanged,
    this.hint,
    this.borderRadius,
    this.maxLines = 1,
    this.minLines = 1,
    this.controller,
    this.focusNode,
    this.contentPadding,
    this.fillColor,
    this.textCapitalization = TextCapitalization.sentences,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: borderRadius ?? BorderRadius.circular(10.0),
        color: fillColor,
      ),
      child: Container(
        margin: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 11.0),
        child: NativeTextInput(
          focusNode: focusNode,
          controller: controller,
          textCapitalization: textCapitalization,
          onChanged: onChanged,
          placeholder: hint,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
