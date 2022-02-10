import 'package:flutter/services.dart';

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final val = newValue.text.isNotEmpty
        ? newValue.text[0].toString().toUpperCase() + newValue.text.substring(1)
        : newValue.text;
    return TextEditingValue(
      text: val,
      selection: newValue.selection,
    );
  }
}
