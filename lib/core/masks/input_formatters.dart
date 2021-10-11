import 'package:flutter/services.dart';

class InputFormatters {
  static TextInputFormatter lettersOnly =
      FilteringTextInputFormatter.allow(RegExp("[a-zA-Zа-яА-Я]"));
}
