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
  final void Function(String)? onFieldSubmitted;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final InputBorder? inputBorder;
  final Widget? suffixIcon;
  final bool useMargin;
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
    this.onFieldSubmitted,
    this.hintStyle,
    this.style,
    this.inputBorder,
    this.suffixIcon,
    this.useMargin = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: inputBorder != null && inputBorder == InputBorder.none
            ? null
            : Border.all(color: Colors.grey),
        borderRadius: borderRadius ?? BorderRadius.circular(10.0),
        color: fillColor,
      ),
      padding: !useMargin
          ? contentPadding ??
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 11.0)
          : null,
      margin: useMargin
          ? contentPadding ??
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 11.0)
          : null,
      child: NativeTextInput(
        focusNode: focusNode,
        controller: controller,
        textCapitalization: textCapitalization,
        onChanged: onChanged,
        placeholder: hint,
        style: style,
        maxLines: maxLines,
        placeholderColor: hintStyle?.color,
        onSubmitted: (str) {
          if (onFieldSubmitted != null && str != null) {
            onFieldSubmitted!(str);
          }
        },
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.transparent,
        ),
      ),
    );
  }
}
