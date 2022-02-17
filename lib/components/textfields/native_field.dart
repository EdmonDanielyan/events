import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ink_mobile/components/textfields/native_ios.dart';

class NativeTextfield extends StatelessWidget {
  final void Function(String)? onChanged;
  final String? hint;
  final BorderRadius? borderRadius;
  final int maxLines;
  final int minLines;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final bool? filled;
  final EdgeInsets? iosPadding;
  final EdgeInsets? contentPadding;
  final bool? isDense;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  const NativeTextfield({
    Key? key,
    required this.onChanged,
    this.hint,
    this.borderRadius,
    this.maxLines = 1,
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
            decoration: InputDecoration(
              hintText: hint,
              filled: filled,
              isDense: isDense,
              contentPadding: contentPadding,
              fillColor: fillColor,
              border: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(10.0),
              ),
            ),
          );
  }
}
