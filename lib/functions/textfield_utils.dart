import 'package:flutter/material.dart';

class TextFieldUtils {
  static void loseTextFieldFocus() {
    if (FocusManager.instance.primaryFocus != null)
      FocusManager.instance.primaryFocus?.unfocus();
  }
}
