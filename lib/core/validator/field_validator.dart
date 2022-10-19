import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FieldValidator {
  final AppLocalizations strings;
  const FieldValidator(this.strings);

  String? emailValidator(
    String? str, {
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

  String? cityValidator(String? str) {
    return str!.length < 1 ? strings.fillTheField : null;
  }

  String? streetValidator(String? str) {
    return str!.length < 8 ? strings.fillTheField : null;
  }

  String? addressValidator(String? str) {
    return str!.length < 18 ? strings.fillTheField : null;
  }

  String? zipCodeValidator(String? str) {
    return str!.length != 6 ? strings.fillTheField : null;
  }
}
