import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/selectfield.dart';

class ManagementFeedbackFormValidator {
  final LanguageStrings strings;
  ManagementFeedbackFormValidator({required this.strings});

  String? toWhomValidator(List<Selectfield>? items) {
    if (items == null || items.length < 1) {
      return strings.chooseAddressee;
    }
    return null;
  }

  String? emailValidator(String? str) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(str!);
    if (str.isNotEmpty && !emailValid) {
      return strings.incorrectEmail;
    }
    return null;
  }

  String? questionValidator(String? str) {
    if (str!.length < 4) {
      return strings.fillTheField;
    }
    return null;
  }
}
