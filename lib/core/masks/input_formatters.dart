import 'package:flutter/services.dart';

class InputFormatters {
  static final String _lettersOnly = "a-z A-Z а-я А-Я";
  static final String _numbersOnly = "0-9";

  static TextInputFormatter numbersOnly =
      FilteringTextInputFormatter.allow(RegExp("[0-9]"));

  static TextInputFormatter lettersOnly =
      FilteringTextInputFormatter.allow(RegExp("[$_lettersOnly]"));

  static TextInputFormatter lettersNumbersOnly =
      FilteringTextInputFormatter.allow(
          RegExp("[$_lettersOnly $_numbersOnly]"));
}
