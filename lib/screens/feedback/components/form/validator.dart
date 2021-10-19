import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/selectfield.dart';

class ManagementFeedbackFormValidator {
  ManagementFeedbackFormValidator();

  String? toWhomValidator(List<Selectfield>? items) {
    if (items == null || items.length < 1) {
      return localizationInstance.chooseAddressee;
    }
    return null;
  }

  String? questionValidator(String? str) {
    if (str!.length < 4) {
      return localizationInstance.fillTheField;
    }
    return null;
  }
}
