import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/selectfield.dart';

class MedicalServicesList {
  static String dentistId = "dentist";
  static String specialistId = "specialist";
  static String researchId = "research";
  static String otherId = "other";

  final LanguageStrings strings;

  MedicalServicesList({required this.strings});

  static Selectfield? getElementFromListById(
      List<Selectfield> items, String id) {
    if (items.length > 0) {
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
