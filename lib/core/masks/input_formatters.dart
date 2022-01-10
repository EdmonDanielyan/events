import 'package:flutter/services.dart';

class InputFormatters {
  String get _lettersOnly => "a-z A-Z а-я А-Я";
  String get _numbersOnly => "0-9";

  TextInputFormatter get numbersOnly =>
      FilteringTextInputFormatter.allow(RegExp("[0-9]"));

  TextInputFormatter get lettersOnly =>
      FilteringTextInputFormatter.allow(RegExp("[$_lettersOnly]"));

  TextInputFormatter get lettersNumbersOnly =>
      FilteringTextInputFormatter.allow(
          RegExp("[$_lettersOnly $_numbersOnly]"));
}
