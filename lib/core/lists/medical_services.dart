import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/selectfield.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MedicalServicesList {
  static String dentistId = "dentist";
  static String specialistId = "specialist";
  static String researchId = "research";
  static String otherId = "other";

  late AppLocalizations strings;

  MedicalServicesList() {
    strings = localizationInstance;
  }

  static Selectfield? getElementFromListById(
      List<Selectfield> items, String id) {
    if (items.isNotEmpty) {
      for (var item in items) {
        if (item.id == id) {
          return item;
        }
      }
    }
    return null;
  }

  List<Selectfield> getList() {
    return [
      Selectfield(
        id: dentistId,
        title: strings.medServiceDentist,
      ),
      Selectfield(
        id: specialistId,
        title: strings.medServiceConsult,
        subWidget: true,
      ),
      Selectfield(
        id: researchId,
        title: strings.medServiceLabResearch,
        subWidget: true,
      ),
      Selectfield(
        id: otherId,
        title: strings.medServiceOther,
        subWidget: true,
      ),
    ];
  }
}
