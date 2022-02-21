import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ink_mobile/components/textfields/native_ios.dart';

class NativeTextfield extends StatelessWidget {
  final void Function(String)? onChanged;
  final String? hint;
  final BorderRadius? borderRadius;
  final int maxLines;
  final int? maxLinesIos;
  final int minLines;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final bool? filled;
  final EdgeInsets? iosPadding;
  final EdgeInsetsGeometry? contentPadding;
  final bool? isDense;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final bool autofocus;
  final void Function(String)? onFieldSubmitted;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final TextInputAction? textInputAction;
  final InputBorder? border;
  final int? maxLength;
  final String? counterText;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final bool useMarginIos;
  const NativeTextfield({
    Key? key,
    required this.onChanged,
    this.hint,
    this.borderRadius,
    this.maxLines = 1,
    this.maxLinesIos,
    this.minLines = 1,
    this.controller,
    this.focusNode,
    this.inputFormatters,
    this.filled,
    this.iosPadding,
    this.contentPadding,
    this.isDense,
    this.fillColor,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.sentences,
    this.autofocus = false,
    this.onFieldSubmitted,
    this.hintStyle,
    this.style,
    this.textInputAction,
    this.border,
    this.maxLength,
    this.counterText,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.useMarginIos = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? NativeIosTextfield(
            controller: controller,
            onChanged: onChanged,
            hint: hint,
            borderRadius: borderRadius,
            maxLines: maxLines,
            minLines: minLines,
            contentPadding: iosPadding,
            fillColor: fillColor,
            textCapitalization: textCapitalization,
            onFieldSubmitted: onFieldSubmitted,
            hintStyle: hintStyle,
            style: style,
            inputBorder: border,
            suffixIcon: suffixIcon,
            useMargin: useMarginIos,
          )
        : TextFormField(
            keyboardType: keyboardType,
            focusNode: focusNode,
            controller: controller,
            textCapitalization: textCapitalization,
            onChanged: onChanged,
            maxLines: maxLines,
            minLines: minLines,
            inputFormatters: inputFormatters,
            autofocus: autofocus,
            onFieldSubmitted: onFieldSubmitted,
            style: style,
            textInputAction: textInputAction,
            maxLength: maxLength,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: hintStyle,
              filled: filled,
              isDense: isDense,
              contentPadding: contentPadding,
              suffixIcon: suffixIcon,
              fillColor: fillColor,
              counterText: counterText,
              suffixIconConstraints: suffixIconConstraints,
              border: border ??
                  OutlineInputBorder(
                    borderRadius: borderRadius ?? BorderRadius.circular(10.0),
                  ),
            ),
          );
  }
}
