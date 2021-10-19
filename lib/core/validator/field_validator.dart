import 'package:ink_mobile/localization/i18n/i18n.dart';

class FieldValidator {
  static String? emailValidator(
    String? str, {
    bool canBeEmpty = false,
  }) {
    if (canBeEmpty && str!.isEmpty) return null;

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(str!);

    if (!emailValid) {
      return localizationInstance.incorrectEmail;
    }
    return null;
  }

  static String? cityValidator(String? str) {
    return str!.length < 5 ? localizationInstance.fillTheField : null;
  }

  static String? streetValidator(String? str) {
    return str!.length < 8 ? localizationInstance.fillTheField : null;
  }

  static String? addressValidator(String? str) {
    return str!.length < 18 ? localizationInstance.fillTheField : null;
  }

  static String? zipCodeValidator(String? str) {
    return str!.length != 6 ? localizationInstance.fillTheField : null;
  }
}
