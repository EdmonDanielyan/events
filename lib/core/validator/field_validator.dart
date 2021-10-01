import 'package:ink_mobile/localization/strings/language.dart';

class FieldValidator {
  static String? emailValidator(
    String? str,
    LanguageStrings strings, {
    bool canBeEmpty = false,
  }) {
    if (canBeEmpty && str!.isEmpty) return null;

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(str!);

    if (!emailValid) {
      return strings.incorrectEmail;
    }
    return null;
  }
}
