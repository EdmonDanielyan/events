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

  static String? cityValidator(String? str, LanguageStrings strings) {
    return str!.length < 5 ? strings.fillTheField : null;
  }

  static String? streetValidator(String? str, LanguageStrings strings) {
    return str!.length < 8 ? strings.fillTheField : null;
  }

  static String? addressValidator(String? str, LanguageStrings strings) {
    return str!.length < 18 ? strings.fillTheField : null;
  }

  static String? zipCodeValidator(String? str, LanguageStrings strings) {
    return str!.length != 6 ? strings.fillTheField : null;
  }
}
