import 'package:ink_mobile/models/data.dart';
import 'package:openapi/openapi.dart';

class LearningMaterialsData extends Data {
  int? id;
  String? title;
  DateTime? dateCreate;
  int? barrels;

  LearningMaterialsData({
    this.id,
    this.title,
    this.dateCreate,
    this.barrels,
  });

  @override
  void fillFromMap(Map map) {
    id = map['id'] is int ? map['id'] : int.tryParse(map['id'].toString());

    title = map['title'] is String ? map['title'] : null;

    dateCreate = map['date_create'] is String
        ? DateTime.tryParse(map['date_create'])
        : null;

    barrels = map['barrels'] is int
        ? map['barrels']
        : int.tryParse(map['barrels'].toString());
  }

  factory LearningMaterialsData.fromMap(Map map) {
    return LearningMaterialsData(
        id: map['id'] is int ? map['id'] : int.tryParse(map['id'].toString()),
        title: map['title'] is String ? map['title'] : null,
        dateCreate: map['date_create'] is String
            ? DateTime.tryParse(map['date_create'])
            : null,
        barrels: map['barrels'] is int
            ? map['barrels']
            : int.tryParse(map['barrels'].toString()));
  }

  factory LearningMaterialsData.fromProperty(PublicationsProperty property) {
    return LearningMaterialsData(
        id: property.id,
        title: property.title,
        barrels: property.votes,
        dateCreate: property.dateCreate);
  }

  static List<LearningMaterialsData> getListFromMap(List list) {
    List<LearningMaterialsData> learningMaterialsList = [];

    for (var element in list) {
      learningMaterialsList.add(LearningMaterialsData.fromMap(element));
    }

    return learningMaterialsList;
  }
}
